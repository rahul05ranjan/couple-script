# CoupleScript Virtual Machine
# Written in x86-64 assembly - completely independent runtime

.section .data
    # VM state
    .comm vm_stack, 8192      # Execution stack
    .comm vm_heap, 1048576    # Heap memory (1MB)
    .comm vm_globals, 4096    # Global variables
    .comm vm_locals, 4096     # Local variables
    
    # Registers
    .comm vm_ip, 8            # Instruction pointer
    .comm vm_sp, 8            # Stack pointer
    .comm vm_bp, 8            # Base pointer
    .comm vm_hp, 8            # Heap pointer
    
    # Error messages
    vm_error_div_zero: .ascii "Runtime Error: Division by zero\n\0"
    vm_error_stack_overflow: .ascii "Runtime Error: Stack overflow\n\0"
    vm_error_stack_underflow: .ascii "Runtime Error: Stack underflow\n\0"
    vm_error_invalid_opcode: .ascii "Runtime Error: Invalid opcode\n\0"
    vm_error_memory: .ascii "Runtime Error: Out of memory\n\0"
    
    # Bytecode buffer
    .comm bytecode, 65536
    .comm bytecode_size, 8

.section .text
    .global vm_init
    .global vm_run
    .global vm_cleanup

# CoupleScript Bytecode Instructions
.equ OP_NOP,         0
.equ OP_PUSH,        1    # Push value onto stack
.equ OP_POP,         2    # Pop value from stack
.equ OP_ADD,         3    # Add two values
.equ OP_SUB,         4    # Subtract
.equ OP_MUL,         5    # Multiply
.equ OP_DIV,         6    # Divide
.equ OP_MOD,         7    # Modulo
.equ OP_EQ,          8    # Equal comparison
.equ OP_NE,          9    # Not equal
.equ OP_LT,          10   # Less than
.equ OP_LE,          11   # Less or equal
.equ OP_GT,          12   # Greater than
.equ OP_GE,          13   # Greater or equal
.equ OP_AND,         14   # Logical AND
.equ OP_OR,          15   # Logical OR
.equ OP_NOT,         16   # Logical NOT
.equ OP_LOAD_GLOBAL, 17   # Load global variable
.equ OP_STORE_GLOBAL,18   # Store global variable
.equ OP_LOAD_LOCAL,  19   # Load local variable
.equ OP_STORE_LOCAL, 20   # Store local variable
.equ OP_JUMP,        21   # Unconditional jump
.equ OP_JUMP_FALSE,  22   # Jump if false
.equ OP_JUMP_TRUE,   23   # Jump if true
.equ OP_CALL,        24   # Function call
.equ OP_RETURN,      25   # Return from function
.equ OP_PRINT,       26   # Print value (remember keyword)
.equ OP_INPUT,       27   # Input value
.equ OP_HALT,        28   # Stop execution

# Value types
.equ TYPE_NUMBER,    1
.equ TYPE_STRING,    2
.equ TYPE_BOOLEAN,   3
.equ TYPE_COUPLE,    4    # Array/List
.equ TYPE_MEMORY,    5    # Object/Dictionary

# Initialize the virtual machine
vm_init:
    push %rbp
    mov %rsp, %rbp
    
    # Initialize stack pointer
    mov $vm_stack, %rax
    add $8192, %rax          # Point to top of stack
    mov %rax, vm_sp
    
    # Initialize base pointer
    mov %rax, vm_bp
    
    # Initialize heap pointer
    mov $vm_heap, %rax
    mov %rax, vm_hp
    
    # Initialize instruction pointer
    mov $bytecode, %rax
    mov %rax, vm_ip
    
    # Clear global variables
    mov $vm_globals, %rdi
    mov $4096, %rcx
    xor %rax, %rax
    rep stosb
    
    # Clear local variables
    mov $vm_locals, %rdi
    mov $4096, %rcx
    xor %rax, %rax
    rep stosb
    
    pop %rbp
    ret

# Run the virtual machine
vm_run:
    push %rbp
    mov %rsp, %rbp
    
    # Main execution loop
vm_loop:
    # Fetch instruction
    mov vm_ip, %rsi
    movb (%rsi), %al
    
    # Decode and execute
    cmp $OP_NOP, %al
    je vm_op_nop
    cmp $OP_PUSH, %al
    je vm_op_push
    cmp $OP_POP, %al
    je vm_op_pop
    cmp $OP_ADD, %al
    je vm_op_add
    cmp $OP_SUB, %al
    je vm_op_sub
    cmp $OP_MUL, %al
    je vm_op_mul
    cmp $OP_DIV, %al
    je vm_op_div
    cmp $OP_EQ, %al
    je vm_op_eq
    cmp $OP_NE, %al
    je vm_op_ne
    cmp $OP_LT, %al
    je vm_op_lt
    cmp $OP_LE, %al
    je vm_op_le
    cmp $OP_GT, %al
    je vm_op_gt
    cmp $OP_GE, %al
    je vm_op_ge
    cmp $OP_AND, %al
    je vm_op_and
    cmp $OP_OR, %al
    je vm_op_or
    cmp $OP_NOT, %al
    je vm_op_not
    cmp $OP_LOAD_GLOBAL, %al
    je vm_op_load_global
    cmp $OP_STORE_GLOBAL, %al
    je vm_op_store_global
    cmp $OP_LOAD_LOCAL, %al
    je vm_op_load_local
    cmp $OP_STORE_LOCAL, %al
    je vm_op_store_local
    cmp $OP_JUMP, %al
    je vm_op_jump
    cmp $OP_JUMP_FALSE, %al
    je vm_op_jump_false
    cmp $OP_JUMP_TRUE, %al
    je vm_op_jump_true
    cmp $OP_CALL, %al
    je vm_op_call
    cmp $OP_RETURN, %al
    je vm_op_return
    cmp $OP_PRINT, %al
    je vm_op_print
    cmp $OP_INPUT, %al
    je vm_op_input
    cmp $OP_HALT, %al
    je vm_halt
    
    # Invalid opcode
    jmp vm_error_invalid_op

vm_op_nop:
    # No operation
    call vm_advance_ip
    jmp vm_loop

vm_op_push:
    # Push immediate value onto stack
    call vm_advance_ip
    
    # Get value type
    mov vm_ip, %rsi
    movb (%rsi), %al
    call vm_advance_ip
    
    # Get value (8 bytes)
    mov vm_ip, %rsi
    mov (%rsi), %rdx
    add $8, vm_ip
    
    # Push type and value
    call vm_stack_push_type
    mov %al, %dl
    call vm_stack_push
    mov %rdx, %rax
    call vm_stack_push
    
    jmp vm_loop

vm_op_pop:
    # Pop value from stack
    call vm_stack_pop
    call vm_advance_ip
    jmp vm_loop

vm_op_add:
    # Add two values
    call vm_stack_pop       # Second operand
    mov %rax, %rdx
    call vm_stack_pop       # First operand
    add %rdx, %rax
    call vm_stack_push
    call vm_advance_ip
    jmp vm_loop

vm_op_sub:
    # Subtract two values
    call vm_stack_pop       # Second operand
    mov %rax, %rdx
    call vm_stack_pop       # First operand
    sub %rdx, %rax
    call vm_stack_push
    call vm_advance_ip
    jmp vm_loop

vm_op_mul:
    # Multiply two values
    call vm_stack_pop       # Second operand
    mov %rax, %rdx
    call vm_stack_pop       # First operand
    imul %rdx, %rax
    call vm_stack_push
    call vm_advance_ip
    jmp vm_loop

vm_op_div:
    # Divide two values
    call vm_stack_pop       # Second operand (divisor)
    mov %rax, %rdx
    cmp $0, %rdx
    je vm_error_division_by_zero
    
    call vm_stack_pop       # First operand (dividend)
    cqo                     # Sign extend for division
    idiv %rdx
    call vm_stack_push
    call vm_advance_ip
    jmp vm_loop

vm_op_eq:
    # Equal comparison
    call vm_stack_pop
    mov %rax, %rdx
    call vm_stack_pop
    cmp %rdx, %rax
    sete %al
    movzx %al, %rax
    call vm_stack_push
    call vm_advance_ip
    jmp vm_loop

vm_op_ne:
    # Not equal comparison
    call vm_stack_pop
    mov %rax, %rdx
    call vm_stack_pop
    cmp %rdx, %rax
    setne %al
    movzx %al, %rax
    call vm_stack_push
    call vm_advance_ip
    jmp vm_loop

vm_op_lt:
    # Less than comparison
    call vm_stack_pop
    mov %rax, %rdx
    call vm_stack_pop
    cmp %rdx, %rax
    setl %al
    movzx %al, %rax
    call vm_stack_push
    call vm_advance_ip
    jmp vm_loop

vm_op_le:
    # Less or equal comparison
    call vm_stack_pop
    mov %rax, %rdx
    call vm_stack_pop
    cmp %rdx, %rax
    setle %al
    movzx %al, %rax
    call vm_stack_push
    call vm_advance_ip
    jmp vm_loop

vm_op_gt:
    # Greater than comparison
    call vm_stack_pop
    mov %rax, %rdx
    call vm_stack_pop
    cmp %rdx, %rax
    setg %al
    movzx %al, %rax
    call vm_stack_push
    call vm_advance_ip
    jmp vm_loop

vm_op_ge:
    # Greater or equal comparison
    call vm_stack_pop
    mov %rax, %rdx
    call vm_stack_pop
    cmp %rdx, %rax
    setge %al
    movzx %al, %rax
    call vm_stack_push
    call vm_advance_ip
    jmp vm_loop

vm_op_and:
    # Logical AND
    call vm_stack_pop
    mov %rax, %rdx
    call vm_stack_pop
    and %rdx, %rax
    call vm_stack_push
    call vm_advance_ip
    jmp vm_loop

vm_op_or:
    # Logical OR
    call vm_stack_pop
    mov %rax, %rdx
    call vm_stack_pop
    or %rdx, %rax
    call vm_stack_push
    call vm_advance_ip
    jmp vm_loop

vm_op_not:
    # Logical NOT
    call vm_stack_pop
    cmp $0, %rax
    sete %al
    movzx %al, %rax
    call vm_stack_push
    call vm_advance_ip
    jmp vm_loop

vm_op_load_global:
    # Load global variable
    call vm_advance_ip
    mov vm_ip, %rsi
    movw (%rsi), %dx        # Variable index
    add $2, vm_ip
    
    # Load from globals array
    mov $vm_globals, %rsi
    movzx %dx, %rax
    imul $8, %rax
    add %rax, %rsi
    mov (%rsi), %rax
    call vm_stack_push
    
    jmp vm_loop

vm_op_store_global:
    # Store global variable
    call vm_advance_ip
    mov vm_ip, %rsi
    movw (%rsi), %dx        # Variable index
    add $2, vm_ip
    
    call vm_stack_pop       # Value to store
    
    # Store to globals array
    mov $vm_globals, %rsi
    movzx %dx, %rcx
    imul $8, %rcx
    add %rcx, %rsi
    mov %rax, (%rsi)
    
    jmp vm_loop

vm_op_load_local:
    # Load local variable
    call vm_advance_ip
    mov vm_ip, %rsi
    movw (%rsi), %dx        # Variable index
    add $2, vm_ip
    
    # Load from locals array
    mov $vm_locals, %rsi
    movzx %dx, %rax
    imul $8, %rax
    add %rax, %rsi
    mov (%rsi), %rax
    call vm_stack_push
    
    jmp vm_loop

vm_op_store_local:
    # Store local variable
    call vm_advance_ip
    mov vm_ip, %rsi
    movw (%rsi), %dx        # Variable index
    add $2, vm_ip
    
    call vm_stack_pop       # Value to store
    
    # Store to locals array
    mov $vm_locals, %rsi
    movzx %dx, %rcx
    imul $8, %rcx
    add %rcx, %rsi
    mov %rax, (%rsi)
    
    jmp vm_loop

vm_op_jump:
    # Unconditional jump
    call vm_advance_ip
    mov vm_ip, %rsi
    movl (%rsi), %eax       # Jump offset
    add %rax, vm_ip
    jmp vm_loop

vm_op_jump_false:
    # Jump if top of stack is false
    call vm_stack_pop
    cmp $0, %rax
    je vm_do_jump
    
    # Don't jump, skip offset
    call vm_advance_ip
    add $4, vm_ip
    jmp vm_loop

vm_do_jump:
    call vm_advance_ip
    mov vm_ip, %rsi
    movl (%rsi), %eax       # Jump offset
    add %rax, vm_ip
    jmp vm_loop

vm_op_jump_true:
    # Jump if top of stack is true
    call vm_stack_pop
    cmp $0, %rax
    jne vm_do_jump
    
    # Don't jump, skip offset
    call vm_advance_ip
    add $4, vm_ip
    jmp vm_loop

vm_op_call:
    # Function call
    # Save current IP on stack
    mov vm_ip, %rax
    call vm_stack_push
    
    # Jump to function
    call vm_advance_ip
    mov vm_ip, %rsi
    movl (%rsi), %eax       # Function address
    mov %rax, vm_ip
    jmp vm_loop

vm_op_return:
    # Return from function
    call vm_stack_pop       # Return value
    mov %rax, %rdx
    
    call vm_stack_pop       # Restore IP
    mov %rax, vm_ip
    
    mov %rdx, %rax          # Put return value back
    call vm_stack_push
    
    jmp vm_loop

vm_op_print:
    # Print value (remember keyword)
    call vm_stack_pop
    call print_value
    call vm_advance_ip
    jmp vm_loop

vm_op_input:
    # Input value
    call read_input
    call vm_stack_push
    call vm_advance_ip
    jmp vm_loop

vm_halt:
    # Stop execution
    pop %rbp
    ret

# Helper functions

vm_advance_ip:
    # Advance instruction pointer by 1
    add $1, vm_ip
    ret

vm_stack_push:
    # Push value in %rax onto VM stack
    mov vm_sp, %rdi
    sub $8, %rdi
    mov %rdi, vm_sp
    
    # Check for stack overflow
    mov $vm_stack, %rsi
    cmp %rsi, %rdi
    jl vm_error_stack_overflow_handler
    
    mov %rax, (%rdi)
    ret

vm_stack_push_type:
    # Push type byte in %dl onto VM stack
    mov vm_sp, %rdi
    sub $1, %rdi
    mov %rdi, vm_sp
    
    # Check for stack overflow
    mov $vm_stack, %rsi
    cmp %rsi, %rdi
    jl vm_error_stack_overflow_handler
    
    mov %dl, (%rdi)
    ret

vm_stack_pop:
    # Pop value from VM stack into %rax
    mov vm_sp, %rdi
    
    # Check for stack underflow
    mov $vm_stack, %rsi
    add $8192, %rsi
    cmp %rsi, %rdi
    jge vm_error_stack_underflow_handler
    
    mov (%rdi), %rax
    add $8, %rdi
    mov %rdi, vm_sp
    ret

print_value:
    # Print value in %rax
    push %rax
    
    # Convert number to string and print
    call number_to_string
    call print_string
    
    # Print newline
    mov $1, %rax            # sys_write
    mov $1, %rdi            # stdout
    mov $newline_char, %rsi
    mov $1, %rdx
    syscall
    
    pop %rax
    ret

number_to_string:
    # Convert number in %rax to string
    # Simplified implementation
    push %rbp
    mov %rsp, %rbp
    
    # Use a buffer to store digits
    mov $number_buffer, %rdi
    mov $10, %rcx           # Base 10
    
    # Handle negative numbers
    cmp $0, %rax
    jge positive_number
    neg %rax
    movb $'-', (%rdi)
    inc %rdi

positive_number:
    # Convert digits
    mov %rdi, %rsi          # Start of buffer
    
convert_loop:
    xor %rdx, %rdx
    div %rcx                # Divide by 10
    add $'0', %rdx          # Convert remainder to ASCII
    mov %dl, (%rdi)
    inc %rdi
    
    cmp $0, %rax
    jne convert_loop
    
    # Null terminate
    movb $0, (%rdi)
    
    # Reverse the string (except sign)
    dec %rdi                # Point to last digit
    call reverse_string
    
    pop %rbp
    ret

reverse_string:
    # Reverse string between %rsi (start) and %rdi (end)
    cmp %rsi, %rdi
    jle reverse_done
    
    movb (%rsi), %al
    movb (%rdi), %bl
    movb %bl, (%rsi)
    movb %al, (%rdi)
    
    inc %rsi
    dec %rdi
    jmp reverse_string

reverse_done:
    ret

print_string:
    # Print null-terminated string at number_buffer
    mov $number_buffer, %rsi
    call strlen
    
    mov $1, %rax            # sys_write
    mov $1, %rdi            # stdout
    mov $number_buffer, %rsi
    mov %rdx, %rdx          # Length from strlen
    syscall
    ret

strlen:
    # Calculate length of string at %rsi, return in %rdx
    xor %rdx, %rdx
strlen_loop:
    cmpb $0, (%rsi, %rdx)
    je strlen_done
    inc %rdx
    jmp strlen_loop
strlen_done:
    ret

read_input:
    # Read input from stdin
    mov $0, %rax            # sys_read
    mov $0, %rdi            # stdin
    mov $input_buffer, %rsi
    mov $256, %rdx
    syscall
    
    # Convert string to number (simplified)
    mov $input_buffer, %rsi
    call string_to_number
    ret

string_to_number:
    # Convert string at %rsi to number in %rax
    xor %rax, %rax
    mov $10, %rcx
    
string_to_number_loop:
    movb (%rsi), %bl
    cmp $'0', %bl
    jl string_to_number_done
    cmp $'9', %bl
    jg string_to_number_done
    
    sub $'0', %bl
    mul %rcx
    add %rbx, %rax
    inc %rsi
    jmp string_to_number_loop

string_to_number_done:
    ret

# Error handlers
vm_error_division_by_zero:
    mov $1, %rax            # sys_write
    mov $2, %rdi            # stderr
    mov $vm_error_div_zero, %rsi
    mov $32, %rdx
    syscall
    
    mov $60, %rax           # sys_exit
    mov $1, %rdi
    syscall

vm_error_stack_overflow_handler:
    mov $1, %rax            # sys_write
    mov $2, %rdi            # stderr
    mov $vm_error_stack_overflow, %rsi
    mov $29, %rdx
    syscall
    
    mov $60, %rax           # sys_exit
    mov $1, %rdi
    syscall

vm_error_stack_underflow_handler:
    mov $1, %rax            # sys_write
    mov $2, %rdi            # stderr
    mov $vm_error_stack_underflow, %rsi
    mov $30, %rdx
    syscall
    
    mov $60, %rax           # sys_exit
    mov $1, %rdi
    syscall

vm_error_invalid_op:
    mov $1, %rax            # sys_write
    mov $2, %rdi            # stderr
    mov $vm_error_invalid_opcode, %rsi
    mov $31, %rdx
    syscall
    
    mov $60, %rax           # sys_exit
    mov $1, %rdi
    syscall

vm_cleanup:
    # Cleanup VM resources
    ret

.section .data
    newline_char: .ascii "\n"
    
.section .bss
    .comm number_buffer, 32
    .comm input_buffer, 256
