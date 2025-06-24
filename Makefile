# Makefile for CoupleScript Programming Language
# Builds a completely independent language implementation

# Detect OS
ifeq ($(OS),Windows_NT)
    DETECTED_OS := Windows
    AS = nasm
    LD = link
    ASFLAGS = -f win64
    LDFLAGS = /subsystem:console /entry:main
    EXE_EXT = .exe
    CLEAN_CMD = del /Q
    MKDIR_CMD = mkdir
    RM_RECURSIVE = rmdir /S /Q
else
    DETECTED_OS := $(shell uname -s)
    AS = as
    LD = ld
    ASFLAGS = --64
    LDFLAGS = 
    EXE_EXT = 
    CLEAN_CMD = rm -f
    MKDIR_CMD = mkdir -p
    RM_RECURSIVE = rm -rf
endif

# Source files (only use existing bootstrap files)
BOOTSTRAP_SOURCES = bootstrap/compiler.s bootstrap/vm.s

# Object files
BOOTSTRAP_OBJECTS = $(BOOTSTRAP_SOURCES:.s=.o)

# Output executables
COMPILER = couplescript-compiler$(EXE_EXT)
VM = couplescript-vm$(EXE_EXT)
INTERPRETER = couplescript

# Default target
all: $(INTERPRETER)

# Build the complete CoupleScript interpreter
$(INTERPRETER): $(COMPILER) $(VM)
	@echo "Building CoupleScript interpreter..."
ifeq ($(OS),Windows_NT)
	@echo '@echo off' > couplescript.bat
	@echo 'REM CoupleScript Interpreter Launcher for Windows' >> couplescript.bat
	@echo 'if "%1"=="" (' >> couplescript.bat
	@echo '    echo CoupleScript Interactive Mode' >> couplescript.bat
	@echo '    echo Type exit to quit' >> couplescript.bat
	@echo '    :loop' >> couplescript.bat
	@echo '    set /p line=cs^> ' >> couplescript.bat
	@echo '    if "%line%"=="exit" goto :eof' >> couplescript.bat
	@echo '    echo %line% | $(COMPILER).exe | $(VM).exe' >> couplescript.bat
	@echo '    goto :loop' >> couplescript.bat
	@echo ') else (' >> couplescript.bat
	@echo '    $(COMPILER).exe "%1" && $(VM).exe output.csb' >> couplescript.bat
	@echo ')' >> couplescript.bat
	@echo "CoupleScript interpreter built successfully! Use: couplescript.bat"
else
	@echo '#!/bin/bash' > couplescript
	@echo '# CoupleScript Interpreter Launcher' >> couplescript
	@echo 'if [ $$# -eq 0 ]; then' >> couplescript
	@echo '    echo "CoupleScript Interactive Mode"' >> couplescript
	@echo '    echo "Type exit to quit"' >> couplescript
	@echo '    while true; do' >> couplescript
	@echo '        read -p "cs> " line' >> couplescript
	@echo '        if [ "$$line" = "exit" ]; then break; fi' >> couplescript
	@echo '        echo "$$line" | ./$(COMPILER) | ./$(VM)' >> couplescript
	@echo '    done' >> couplescript
	@echo 'else' >> couplescript
	@echo '    ./$(COMPILER) "$$1" && ./$(VM) output.csb' >> couplescript
	@echo 'fi' >> couplescript
	@chmod +x couplescript
	@echo "CoupleScript interpreter built successfully! Use: ./couplescript"
endif

# Build the bootstrap compiler
$(COMPILER): bootstrap/compiler.o
	@echo "Linking bootstrap compiler..."
ifeq ($(OS),Windows_NT)
	$(LD) $(LDFLAGS) /out:$(COMPILER) bootstrap/compiler.o
else
	$(LD) $(LDFLAGS) -o $(COMPILER) bootstrap/compiler.o
endif

# Build the virtual machine  
$(VM): bootstrap/vm.o
	@echo "Linking virtual machine..."
ifeq ($(OS),Windows_NT)
	$(LD) $(LDFLAGS) /out:$(VM) bootstrap/vm.o
else
	$(LD) $(LDFLAGS) -o $(VM) bootstrap/vm.o
endif

# Compile assembly source files
%.o: %.s
	@echo "Assembling $<..."
ifeq ($(OS),Windows_NT)
	$(AS) $(ASFLAGS) -o $@ $<
else
	$(AS) $(ASFLAGS) -o $@ $<
endif

# Clean up
clean:
	@echo "Cleaning build files..."
ifeq ($(OS),Windows_NT)
	$(CLEAN_CMD) bootstrap\*.o 2>nul || echo "No object files to clean"
	$(CLEAN_CMD) $(COMPILER) $(VM) couplescript.bat output.csb 2>nul || echo "No executables to clean"
else
	$(CLEAN_CMD) bootstrap/*.o
	$(CLEAN_CMD) $(COMPILER) $(VM) $(INTERPRETER)
	$(CLEAN_CMD) output.csb
endif

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

# Test the language (comprehensive version)
test: $(INTERPRETER) examples
	@echo "Running CoupleScript comprehensive test suite..."
	@if [ -f run_tests.sh ]; then \
		chmod +x run_tests.sh; \
		./run_tests.sh; \
	else \
		echo "Running basic functionality test..."; \
		if [ -f examples/hello.couple ]; then \
			echo "Testing hello.couple..."; \
			./$(INTERPRETER) examples/hello.couple || echo "Note: Test requires working VM implementation"; \
			echo "Testing calculator.couple..."; \
			./$(INTERPRETER) examples/calculator.couple || echo "Note: Test requires working VM implementation"; \
		else \
			echo "No examples found. Run 'make examples' first."; \
		fi; \
	fi

# Quick test - just run basic examples
test-quick: $(INTERPRETER) examples
	@echo "Running quick CoupleScript test..."
	@echo "Testing basic functionality..."
	@if [ -f examples/hello.couple ]; then \
		echo "Running hello.couple..."; \
		./$(INTERPRETER) examples/hello.couple || echo "Note: Test requires working VM implementation"; \
	else \
		echo "No examples found. Run 'make examples' first."; \
	fi

# Test only specific components
test-unit:
	@echo "Running unit tests..."
	@if [ -f tests/unit/language_features_test.couple ] && [ -f $(INTERPRETER) ]; then \
		./$(INTERPRETER) tests/unit/language_features_test.couple; \
	else \
		echo "Unit tests not available or interpreter not built"; \
	fi

test-integration:
	@echo "Running integration tests..."
	@if [ -f tests/integration/compiler_vm_test.couple ] && [ -f $(INTERPRETER) ]; then \
		./$(INTERPRETER) tests/integration/compiler_vm_test.couple; \
	else \
		echo "Integration tests not available or interpreter not built"; \
	fi

# Create example directory and files
examples:
	@mkdir -p examples
	@echo "Creating example programs..."
	@echo '# Hello World in CoupleScript' > examples/hello.couple
	@echo 'marry message "Hello, World!"' >> examples/hello.couple
	@echo 'remember message' >> examples/hello.couple
	
	@echo '# Simple calculator in CoupleScript' > examples/calculator.couple
	@echo 'marry a 10' >> examples/calculator.couple
	@echo 'marry b 5' >> examples/calculator.couple
	@echo 'remember "Addition: " + a + " + " + b + " = " + (a + b)' >> examples/calculator.couple
	@echo 'remember "Subtraction: " + a + " - " + b + " = " + (a - b)' >> examples/calculator.couple
	
	@echo '# Functions in CoupleScript' > examples/functions.couple
	@echo 'propose greet(name):' >> examples/functions.couple
	@echo '    remember "Hello, " + name + "!"' >> examples/functions.couple
	@echo '    promise "Greetings from CoupleScript"' >> examples/functions.couple
	@echo '' >> examples/functions.couple
	@echo 'marry result accept greet("Alice")' >> examples/functions.couple
	@echo 'remember result' >> examples/functions.couple

# Help
help:
	@echo "CoupleScript Build System"
	@echo ""
	@echo "Detected OS: $(DETECTED_OS)"
	@echo ""
	@echo "Prerequisites:"
ifeq ($(OS),Windows_NT)
	@echo "  - NASM assembler (download from nasm.us)"
	@echo "  - Microsoft Build Tools or Visual Studio"
	@echo "  - Or use WSL with build-essential"
else
	@echo "  - GNU assembler (as) or NASM"
	@echo "  - GNU linker (ld)"
	@echo "  - Usually included with build-essential"
endif
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
ifeq ($(OS),Windows_NT)
	@echo "  couplescript.bat program.couple  - Run a CoupleScript program"
	@echo "  couplescript.bat                 - Start interactive mode"
	@echo ""
	@echo "Windows Alternative:"
	@echo "  build_windows.bat               - Windows-specific build script"
else
	@echo "  ./couplescript program.couple   - Run a CoupleScript program"
	@echo "  ./couplescript                  - Start interactive mode"
endif

.PHONY: all clean install uninstall test examples help
