# Makefile for CoupleScript Programming Language
# Builds a completely independent language implementation

# Assembler and linker
AS = as
LD = ld

# Source files
BOOTSTRAP_SOURCES = bootstrap/compiler.s bootstrap/vm.s
RUNTIME_SOURCES = runtime/main.s runtime/io.s runtime/memory.s

# Object files
BOOTSTRAP_OBJECTS = $(BOOTSTRAP_SOURCES:.s=.o)
RUNTIME_OBJECTS = $(RUNTIME_SOURCES:.s=.o)

# Output executables
COMPILER = couplescript-compiler
VM = couplescript-vm
INTERPRETER = couplescript

# Default target
all: $(INTERPRETER)

# Build the complete CoupleScript interpreter
$(INTERPRETER): $(COMPILER) $(VM)
	@echo "Building CoupleScript interpreter..."
	cat > couplescript << 'EOF'
#!/bin/bash
# CoupleScript Interpreter Launcher

if [ $$# -eq 0 ]; then
    echo "CoupleScript Interactive Mode"
    echo "Type 'exit' to quit"
    echo ""
    while true; do
        read -p "cs> " line
        if [ "$$line" = "exit" ]; then
            break
        fi
        echo "$$line" | ./$(COMPILER) | ./$(VM)
    done
else
    if [ "$$1" = "-i" ]; then
        # Interactive mode
        echo "CoupleScript Interactive Mode"
        echo "Type 'exit' to quit"
        echo ""
        while true; do
            read -p "cs> " line
            if [ "$$line" = "exit" ]; then
                break
            fi
            echo "$$line" | ./$(COMPILER) | ./$(VM)
        done
    else
        # Compile and run file
        ./$(COMPILER) "$$1" && ./$(VM) output.csb
    fi
fi
EOF
	chmod +x couplescript
	@echo "CoupleScript interpreter built successfully!"

# Build the bootstrap compiler
$(COMPILER): $(BOOTSTRAP_OBJECTS)
	@echo "Linking bootstrap compiler..."
	$(LD) -o $(COMPILER) $(BOOTSTRAP_OBJECTS)

# Build the virtual machine
$(VM): runtime/vm-main.o bootstrap/vm.o runtime/io.o runtime/memory.o
	@echo "Linking virtual machine..."
	$(LD) -o $(VM) runtime/vm-main.o bootstrap/vm.o runtime/io.o runtime/memory.o

# Compile assembly source files
%.o: %.s
	@echo "Assembling $<..."
	$(AS) --64 -o $@ $<

# Create runtime directory and files
runtime/vm-main.s:
	@mkdir -p runtime
	@echo "Creating VM main entry point..."
	cat > runtime/vm-main.s << 'EOF'
# CoupleScript Virtual Machine Main Entry Point

.section .text
    .global _start

_start:
    # Initialize VM
    call vm_init
    
    # Check command line arguments
    mov %rsp, %rbp
    mov 8(%rbp), %rdi    # argc
    cmp $$2, %rdi
    jl usage_error_vm
    
    # Load bytecode file
    mov 16(%rbp), %rdi   # argv[1]
    call load_bytecode_file
    
    # Run the VM
    call vm_run
    
    # Cleanup and exit
    call vm_cleanup
    mov $$60, %rax       # sys_exit
    mov $$0, %rdi
    syscall

load_bytecode_file:
    push %rbp
    mov %rsp, %rbp
    
    # Open bytecode file
    mov $$2, %rax        # sys_open
    mov $$0, %rsi        # O_RDONLY
    syscall
    
    cmp $$0, %rax
    jl file_error_vm
    
    # Read bytecode
    mov %rax, %rdi       # file descriptor
    mov $$0, %rax        # sys_read
    mov $$bytecode, %rsi
    mov $$65535, %rdx
    syscall
    
    mov %rax, bytecode_size
    
    # Close file
    mov $$3, %rax        # sys_close
    syscall
    
    pop %rbp
    ret

usage_error_vm:
    mov $$1, %rax        # sys_write
    mov $$1, %rdi        # stdout
    mov $$usage_vm_msg, %rsi
    mov $$usage_vm_len, %rdx
    syscall
    
    mov $$60, %rax       # sys_exit
    mov $$1, %rdi
    syscall

file_error_vm:
    mov $$1, %rax        # sys_write
    mov $$2, %rdi        # stderr
    mov $$file_error_vm_msg, %rsi
    mov $$file_error_vm_len, %rdx
    syscall
    
    mov $$60, %rax       # sys_exit
    mov $$1, %rdi
    syscall

.section .data
    usage_vm_msg: .ascii "Usage: couplescript-vm <bytecode_file>\n"
    usage_vm_len = . - usage_vm_msg
    file_error_vm_msg: .ascii "Error: Could not open bytecode file\n"
    file_error_vm_len = . - file_error_vm_msg
EOF

runtime/io.s:
	@echo "Creating I/O runtime..."
	cat > runtime/io.s << 'EOF'
# CoupleScript I/O Runtime Functions

.section .text
    .global cs_print_string
    .global cs_print_number
    .global cs_read_string
    .global cs_read_number

cs_print_string:
    # Print null-terminated string pointed to by %rdi
    push %rbp
    mov %rsp, %rbp
    
    # Calculate string length
    mov %rdi, %rsi
    call cs_strlen
    
    # Write to stdout
    mov $$1, %rax        # sys_write
    mov $$1, %rdi        # stdout
    mov %rsi, %rsi       # string pointer
    mov %rdx, %rdx       # length
    syscall
    
    pop %rbp
    ret

cs_print_number:
    # Print number in %rdi
    push %rbp
    mov %rsp, %rbp
    
    # Convert to string
    mov %rdi, %rax
    mov $$cs_number_buffer, %rdi
    call cs_number_to_string
    
    # Print the string
    mov $$cs_number_buffer, %rdi
    call cs_print_string
    
    pop %rbp
    ret

cs_read_string:
    # Read string into buffer pointed to by %rdi, max length in %rsi
    push %rbp
    mov %rsp, %rbp
    
    mov $$0, %rax        # sys_read
    mov $$0, %rdi        # stdin
    # %rsi already contains buffer
    mov %rdx, %rdx       # max length
    syscall
    
    # Null-terminate the string
    mov %rax, %rcx       # bytes read
    cmp $$0, %rcx
    jle read_string_done
    
    # Remove newline if present
    dec %rcx
    cmpb $$10, (%rsi, %rcx)  # newline
    jne read_string_done
    movb $$0, (%rsi, %rcx)
    
read_string_done:
    pop %rbp
    ret

cs_read_number:
    # Read number from stdin, return in %rax
    push %rbp
    mov %rsp, %rbp
    
    # Read string first
    mov $$cs_input_buffer, %rdi
    mov $$256, %rsi
    call cs_read_string
    
    # Convert string to number
    mov $$cs_input_buffer, %rsi
    call cs_string_to_number
    
    pop %rbp
    ret

cs_strlen:
    # Calculate length of string at %rsi, return in %rdx
    xor %rdx, %rdx
cs_strlen_loop:
    cmpb $$0, (%rsi, %rdx)
    je cs_strlen_done
    inc %rdx
    jmp cs_strlen_loop
cs_strlen_done:
    ret

cs_number_to_string:
    # Convert number in %rax to string at %rdi
    push %rbp
    mov %rsp, %rbp
    push %rbx
    
    mov $$10, %rcx       # Base 10
    mov %rdi, %rbx       # Save buffer start
    
    # Handle zero
    cmp $$0, %rax
    jne cs_not_zero
    movb $$'0', (%rdi)
    movb $$0, 1(%rdi)
    jmp cs_number_to_string_done
    
cs_not_zero:
    # Handle negative numbers
    cmp $$0, %rax
    jge cs_positive
    movb $$'-', (%rdi)
    inc %rdi
    neg %rax
    
cs_positive:
    mov %rdi, %rsi       # Start of digits
    
cs_convert_loop:
    xor %rdx, %rdx
    div %rcx             # Divide by 10
    add $$'0', %rdx      # Convert remainder to ASCII
    movb %dl, (%rdi)
    inc %rdi
    
    cmp $$0, %rax
    jne cs_convert_loop
    
    # Null terminate
    movb $$0, (%rdi)
    
    # Reverse the digits
    dec %rdi             # Point to last digit
    call cs_reverse_string
    
cs_number_to_string_done:
    pop %rbx
    pop %rbp
    ret

cs_reverse_string:
    # Reverse string between %rsi (start) and %rdi (end)
    cmp %rsi, %rdi
    jle cs_reverse_done
    
    movb (%rsi), %al
    movb (%rdi), %bl
    movb %bl, (%rsi)
    movb %al, (%rdi)
    
    inc %rsi
    dec %rdi
    jmp cs_reverse_string
    
cs_reverse_done:
    ret

cs_string_to_number:
    # Convert string at %rsi to number in %rax
    xor %rax, %rax
    mov $$10, %rcx
    xor %rdx, %rdx       # Sign flag (0 = positive, 1 = negative)
    
    # Check for negative sign
    cmpb $$'-', (%rsi)
    jne cs_str_to_num_loop
    mov $$1, %rdx
    inc %rsi
    
cs_str_to_num_loop:
    movb (%rsi), %bl
    cmp $$'0', %bl
    jl cs_str_to_num_done
    cmp $$'9', %bl
    jg cs_str_to_num_done
    
    sub $$'0', %bl
    mul %rcx
    movzx %bl, %rbx
    add %rbx, %rax
    inc %rsi
    jmp cs_str_to_num_loop

cs_str_to_num_done:
    # Apply sign
    cmp $$1, %rdx
    jne cs_str_to_num_positive
    neg %rax
    
cs_str_to_num_positive:
    ret

.section .bss
    .comm cs_number_buffer, 32
    .comm cs_input_buffer, 256
EOF

runtime/memory.s:
	@echo "Creating memory management runtime..."
	cat > runtime/memory.s << 'EOF'
# CoupleScript Memory Management Runtime

.section .text
    .global cs_malloc
    .global cs_free
    .global cs_realloc
    .global cs_memcpy
    .global cs_memset

# Simple memory allocator using brk() system call
cs_malloc:
    # Allocate memory, size in %rdi, return pointer in %rax
    push %rbp
    mov %rsp, %rbp
    
    # Get current break
    mov $$12, %rax       # sys_brk
    mov $$0, %rdi        # NULL to get current break
    syscall
    
    mov %rax, %rsi       # Save current break
    
    # Set new break
    add %rdi, %rax       # Add requested size
    mov %rax, %rdi
    mov $$12, %rax       # sys_brk
    syscall
    
    # Return old break (start of allocated memory)
    mov %rsi, %rax
    
    pop %rbp
    ret

cs_free:
    # Free memory (simplified - just a stub for now)
    # In a real implementation, this would maintain a free list
    ret

cs_realloc:
    # Reallocate memory
    # %rdi = old pointer, %rsi = new size
    # Returns new pointer in %rax
    push %rbp
    mov %rsp, %rbp
    push %rdi
    push %rsi
    
    # Allocate new memory
    mov %rsi, %rdi       # New size
    call cs_malloc
    
    # Copy old data (assuming we know the old size - simplified)
    pop %rdx             # New size (used as copy size)
    pop %rsi             # Old pointer
    mov %rax, %rdi       # New pointer
    
    # If old pointer is NULL, just return new pointer
    cmp $$0, %rsi
    je cs_realloc_done
    
    call cs_memcpy
    
cs_realloc_done:
    pop %rbp
    ret

cs_memcpy:
    # Copy memory: %rdi = dest, %rsi = src, %rdx = size
    push %rbp
    mov %rsp, %rbp
    
    mov %rdx, %rcx       # Size to copy
    cld                  # Clear direction flag
    rep movsb            # Copy byte by byte
    
    pop %rbp
    ret

cs_memset:
    # Set memory: %rdi = dest, %rsi = value, %rdx = size
    push %rbp
    mov %rsp, %rbp
    
    mov %rsi, %rax       # Value to set
    mov %rdx, %rcx       # Size
    cld                  # Clear direction flag
    rep stosb            # Set byte by byte
    
    pop %rbp
    ret
EOF

# Clean up
clean:
	@echo "Cleaning build files..."
	rm -f $(BOOTSTRAP_OBJECTS) $(RUNTIME_OBJECTS)
	rm -f runtime/*.o
	rm -f $(COMPILER) $(VM) $(INTERPRETER)
	rm -f output.csb
	rm -rf runtime

# Install (copy to system PATH)
install: $(INTERPRETER)
	@echo "Installing CoupleScript..."
	cp $(INTERPRETER) /usr/local/bin/
	cp $(COMPILER) /usr/local/bin/
	cp $(VM) /usr/local/bin/
	@echo "CoupleScript installed successfully!"

# Uninstall
uninstall:
	@echo "Uninstalling CoupleScript..."
	rm -f /usr/local/bin/$(INTERPRETER)
	rm -f /usr/local/bin/$(COMPILER)
	rm -f /usr/local/bin/$(VM)
	@echo "CoupleScript uninstalled successfully!"

# Test the language
test: $(INTERPRETER)
	@echo "Running CoupleScript tests..."	./$(INTERPRETER) examples/hello.couple
	./$(INTERPRETER) examples/calculator.couple
	@echo "All tests passed!"

# Create example directory and files
examples:
	@mkdir -p examples
	@echo "Creating example programs..."
	cat > examples/hello.couple << 'EOF'
# Hello World in CoupleScript
marry message "Hello, World!"
remember message
EOF
	
	cat > examples/calculator.couple << 'EOF'
# Simple calculator in CoupleScript
marry a 10
marry b 5

remember "Addition: " + a + " + " + b + " = " + (a + b)
remember "Subtraction: " + a + " - " + b + " = " + (a - b)
remember "Multiplication: " + a + " * " + b + " = " + (a * b)
remember "Division: " + a + " / " + b + " = " + (a / b)

# Conditional logic
argue a > b:
    remember a + " is greater than " + b
makeup:
    remember a + " is not greater than " + b
EOF
	
	cat > examples/functions.couple << 'EOF'
# Functions in CoupleScript
propose greet(name):
    remember "Hello, " + name + "!"
    promise "Greetings from CoupleScript"

propose add(x, y):
    promise x + y

marry result accept greet("Alice")
remember result

marry sum accept add(15, 25)
remember "Sum: " + sum
EOF
	
	cat > examples/loops.couple << 'EOF'
# Loops in CoupleScript
marry numbers couple[1, 2, 3, 4, 5]

remember "Counting with anniversary loop:"
anniversary num in numbers:
    remember "Number: " + num
    argue num == 3:
        remember "Found three!"
        separate
EOF

# Help
help:
	@echo "CoupleScript Build System"
	@echo ""
	@echo "Targets:"
	@echo "  all       - Build the complete CoupleScript interpreter"
	@echo "  clean     - Remove all build files"
	@echo "  install   - Install CoupleScript to system PATH"
	@echo "  uninstall - Remove CoupleScript from system"
	@echo "  test      - Run test programs"
	@echo "  examples  - Create example CoupleScript programs"
	@echo "  help      - Show this help message"
	@echo ""
	@echo "Usage after building:"
	@echo "  ./couplescript program.couple  - Run a CoupleScript program"
	@echo "  ./couplescript -i          - Start interactive mode"

.PHONY: all clean install uninstall test examples help
