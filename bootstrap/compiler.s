# CoupleScript Bootstrap Compiler
# Written in x86-64 assembly to bootstrap the language
# This creates the initial compiler that can then compile CoupleScript itself

.section .data
    # String constants for CoupleScript keywords
    marry_kw:    .ascii "marry\0"
    divorce_kw:  .ascii "divorce\0"
    propose_kw:  .ascii "propose\0"
    accept_kw:   .ascii "accept\0"
    argue_kw:    .ascii "argue\0"
    makeup_kw:   .ascii "makeup\0"
    remember_kw: .ascii "remember\0"
    promise_kw:  .ascii "promise\0"
    love_kw:     .ascii "love\0"
    hate_kw:     .ascii "hate\0"
    
    # Error messages
    syntax_error: .ascii "Syntax Error: Unexpected token\n\0"
    file_error:   .ascii "Error: Could not open file\n\0"
    
    # File buffer
    .comm file_buffer, 65536
    .comm token_buffer, 1024
    
.section .text
    .global _start

_start:
    # Get command line arguments
    mov %rsp, %rbp
    mov 8(%rbp), %rdi    # argc
    cmp $2, %rdi
    jl usage_error
    
    # Open source file
    mov 16(%rbp), %rdi   # argv[1]
    mov $2, %rax         # sys_open
    mov $0, %rsi         # O_RDONLY
    syscall
    
    cmp $0, %rax
    jl file_open_error
    
    # Read file into buffer
    mov %rax, %rdi       # file descriptor
    mov $0, %rax         # sys_read
    mov $file_buffer, %rsi
    mov $65535, %rdx
    syscall
    
    # Close file
    mov $3, %rax         # sys_close
    syscall
    
    # Start lexical analysis
    mov $file_buffer, %rdi
    call tokenize
    
    # Start parsing
    call parse
    
    # Generate bytecode
    call generate_bytecode
    
    # Write output file
    call write_output
    
    # Exit successfully
    mov $60, %rax        # sys_exit
    mov $0, %rdi
    syscall

# Tokenizer function
tokenize:
    push %rbp
    mov %rsp, %rbp
    
    # %rdi points to source code
    mov %rdi, %rsi       # source pointer
    mov $token_buffer, %rdi  # token buffer
    
tokenize_loop:
    # Skip whitespace
    call skip_whitespace
    
    # Check for end of file
    cmpb $0, (%rsi)
    je tokenize_done
    
    # Check for keywords
    call match_keyword
    cmp $0, %rax
    jne token_found
    
    # Check for identifiers
    call match_identifier
    cmp $0, %rax
    jne token_found
    
    # Check for numbers
    call match_number
    cmp $0, %rax
    jne token_found
    
    # Check for strings
    call match_string
    cmp $0, %rax
    jne token_found
    
    # Check for operators
    call match_operator
    cmp $0, %rax
    jne token_found
    
    # Unknown character - syntax error
    jmp syntax_error_handler

token_found:
    # Move to next character
    inc %rsi
    jmp tokenize_loop

tokenize_done:
    pop %rbp
    ret

# Skip whitespace characters
skip_whitespace:
    cmpb $32, (%rsi)     # space
    je skip_char
    cmpb $9, (%rsi)      # tab
    je skip_char
    cmpb $10, (%rsi)     # newline
    je skip_char
    cmpb $13, (%rsi)     # carriage return
    je skip_char
    ret
    
skip_char:
    inc %rsi
    jmp skip_whitespace

# Match CoupleScript keywords
match_keyword:
    push %rbp
    mov %rsp, %rbp
    
    # Check for "marry"
    mov $marry_kw, %rdi
    call strcmp
    cmp $0, %rax
    je keyword_marry
    
    # Check for "divorce"
    mov $divorce_kw, %rdi
    call strcmp
    cmp $0, %rax
    je keyword_divorce
    
    # Check for "propose"
    mov $propose_kw, %rdi
    call strcmp
    cmp $0, %rax
    je keyword_propose
    
    # Check for "accept"
    mov $accept_kw, %rdi
    call strcmp
    cmp $0, %rax
    je keyword_accept
    
    # Check for "argue"
    mov $argue_kw, %rdi
    call strcmp
    cmp $0, %rax
    je keyword_argue
    
    # Check for "makeup"
    mov $makeup_kw, %rdi
    call strcmp
    cmp $0, %rax
    je keyword_makeup
    
    # Check for "remember"
    mov $remember_kw, %rdi
    call strcmp
    cmp $0, %rax
    je keyword_remember
    
    # Check for "promise"
    mov $promise_kw, %rdi
    call strcmp
    cmp $0, %rax
    je keyword_promise
    
    # Check for "love"
    mov $love_kw, %rdi
    call strcmp
    cmp $0, %rax
    je keyword_love
    
    # Check for "hate"
    mov $hate_kw, %rdi
    call strcmp
    cmp $0, %rax
    je keyword_hate
    
    # No keyword match
    mov $0, %rax
    pop %rbp
    ret

keyword_marry:
    mov $1, %rax         # TOKEN_MARRY
    pop %rbp
    ret

keyword_divorce:
    mov $2, %rax         # TOKEN_DIVORCE
    pop %rbp
    ret

keyword_propose:
    mov $3, %rax         # TOKEN_PROPOSE
    pop %rbp
    ret

keyword_accept:
    mov $4, %rax         # TOKEN_ACCEPT
    pop %rbp
    ret

keyword_argue:
    mov $5, %rax         # TOKEN_ARGUE
    pop %rbp
    ret

keyword_makeup:
    mov $6, %rax         # TOKEN_MAKEUP
    pop %rbp
    ret

keyword_remember:
    mov $7, %rax         # TOKEN_REMEMBER
    pop %rbp
    ret

keyword_promise:
    mov $8, %rax         # TOKEN_PROMISE
    pop %rbp
    ret

keyword_love:
    mov $9, %rax         # TOKEN_LOVE
    pop %rbp
    ret

keyword_hate:
    mov $10, %rax        # TOKEN_HATE
    pop %rbp
    ret

# Match identifiers (variable names, function names)
match_identifier:
    push %rbp
    mov %rsp, %rbp
    
    # Check if first character is alphabetic or underscore
    movb (%rsi), %al
    cmp $'a', %al
    jl check_upper
    cmp $'z', %al
    jle identifier_start
    
check_upper:
    cmp $'A', %al
    jl check_underscore
    cmp $'Z', %al
    jle identifier_start
    
check_underscore:
    cmp $'_', %al
    je identifier_start
    
    # Not an identifier
    mov $0, %rax
    pop %rbp
    ret

identifier_start:
    # Found identifier, scan until end
    mov %rsi, %rdx       # start position
    
identifier_loop:
    inc %rsi
    movb (%rsi), %al
    
    # Check if alphanumeric or underscore
    cmp $'a', %al
    jl check_upper_id
    cmp $'z', %al
    jle identifier_loop
    
check_upper_id:
    cmp $'A', %al
    jl check_digit
    cmp $'Z', %al
    jle identifier_loop
    
check_digit:
    cmp $'0', %al
    jl check_underscore_id
    cmp $'9', %al
    jle identifier_loop
    
check_underscore_id:
    cmp $'_', %al
    je identifier_loop
    
    # End of identifier
    mov $11, %rax        # TOKEN_IDENTIFIER
    pop %rbp
    ret

# Match numbers
match_number:
    push %rbp
    mov %rsp, %rbp
    
    movb (%rsi), %al
    cmp $'0', %al
    jl not_number
    cmp $'9', %al
    jg not_number
    
    # Found digit, scan number
number_loop:
    inc %rsi
    movb (%rsi), %al
    cmp $'0', %al
    jl check_decimal
    cmp $'9', %al
    jle number_loop
    
check_decimal:
    cmp $'.', %al
    jne number_done
    
    # Decimal point found
    inc %rsi
decimal_loop:
    movb (%rsi), %al
    cmp $'0', %al
    jl number_done
    cmp $'9', %al
    jg number_done
    inc %rsi
    jmp decimal_loop
    
number_done:
    dec %rsi             # Back up one character
    mov $12, %rax        # TOKEN_NUMBER
    pop %rbp
    ret

not_number:
    mov $0, %rax
    pop %rbp
    ret

# Match string literals
match_string:
    push %rbp
    mov %rsp, %rbp
    
    movb (%rsi), %al
    cmp $'"', %al
    je string_start
    cmp $'\'', %al
    je string_start
    
    # Not a string
    mov $0, %rax
    pop %rbp
    ret

string_start:
    mov %al, %dl         # Store quote character
    inc %rsi
    
string_loop:
    movb (%rsi), %al
    cmp $0, %al          # End of file
    je string_error
    cmp %dl, %al         # Matching quote
    je string_done
    
    # Check for escape sequence
    cmp $'\\', %al
    je escape_char
    
    inc %rsi
    jmp string_loop

escape_char:
    inc %rsi             # Skip backslash
    inc %rsi             # Skip escaped character
    jmp string_loop

string_done:
    mov $13, %rax        # TOKEN_STRING
    pop %rbp
    ret

string_error:
    # Unterminated string
    jmp syntax_error_handler

# Match operators and delimiters
match_operator:
    push %rbp
    mov %rsp, %rbp
    
    movb (%rsi), %al
    
    cmp $'+', %al
    je op_plus
    cmp $'-', %al
    je op_minus
    cmp $'*', %al
    je op_multiply
    cmp $'/', %al
    je op_divide
    cmp $'=', %al
    je op_assign
    cmp $'(', %al
    je op_lparen
    cmp $')', %al
    je op_rparen
    cmp $'[', %al
    je op_lbracket
    cmp $']', %al
    je op_rbracket
    cmp $'{', %al
    je op_lbrace
    cmp $'}', %al
    je op_rbrace
    cmp $',', %al
    je op_comma
    cmp $':', %al
    je op_colon
    cmp $';', %al
    je op_semicolon
    
    # No operator match
    mov $0, %rax
    pop %rbp
    ret

op_plus:
    mov $20, %rax        # TOKEN_PLUS
    pop %rbp
    ret

op_minus:
    mov $21, %rax        # TOKEN_MINUS
    pop %rbp
    ret

op_multiply:
    mov $22, %rax        # TOKEN_MULTIPLY
    pop %rbp
    ret

op_divide:
    mov $23, %rax        # TOKEN_DIVIDE
    pop %rbp
    ret

op_assign:
    mov $24, %rax        # TOKEN_ASSIGN
    pop %rbp
    ret

op_lparen:
    mov $25, %rax        # TOKEN_LPAREN
    pop %rbp
    ret

op_rparen:
    mov $26, %rax        # TOKEN_RPAREN
    pop %rbp
    ret

op_lbracket:
    mov $27, %rax        # TOKEN_LBRACKET
    pop %rbp
    ret

op_rbracket:
    mov $28, %rax        # TOKEN_RBRACKET
    pop %rbp
    ret

op_lbrace:
    mov $29, %rax        # TOKEN_LBRACE
    pop %rbp
    ret

op_rbrace:
    mov $30, %rax        # TOKEN_RBRACE
    pop %rbp
    ret

op_comma:
    mov $31, %rax        # TOKEN_COMMA
    pop %rbp
    ret

op_colon:
    mov $32, %rax        # TOKEN_COLON
    pop %rbp
    ret

op_semicolon:
    mov $33, %rax        # TOKEN_SEMICOLON
    pop %rbp
    ret

# String comparison function
strcmp:
    push %rbp
    mov %rsp, %rbp
    
    # %rdi = keyword, %rsi = source position
    mov %rsi, %rdx       # Save source position
    
strcmp_loop:
    movb (%rdi), %al
    movb (%rdx), %bl
    
    cmp %al, %bl
    jne strcmp_no_match
    
    cmp $0, %al          # End of string
    je strcmp_match
    
    inc %rdi
    inc %rdx
    jmp strcmp_loop

strcmp_match:
    mov $0, %rax         # Match
    pop %rbp
    ret

strcmp_no_match:
    mov $1, %rax         # No match
    pop %rbp
    ret

# Parser (simplified recursive descent)
parse:
    push %rbp
    mov %rsp, %rbp
    
    # Initialize parser state
    mov $token_buffer, %rdi
    
    # Parse program (list of statements)
parse_program:
    call parse_statement
    cmp $0, %rax
    je parse_done
    jmp parse_program

parse_done:
    pop %rbp
    ret

# Parse a single statement
parse_statement:
    push %rbp
    mov %rsp, %rbp
    
    # Check token type and dispatch
    movl (%rdi), %eax
    
    cmp $1, %eax         # TOKEN_MARRY
    je parse_assignment
    cmp $3, %eax         # TOKEN_PROPOSE
    je parse_function_def
    cmp $4, %eax         # TOKEN_ACCEPT
    je parse_function_call
    cmp $5, %eax         # TOKEN_ARGUE
    je parse_if_statement
    cmp $7, %eax         # TOKEN_REMEMBER
    je parse_print_statement
    
    # Unknown statement
    mov $0, %rax
    pop %rbp
    ret

parse_assignment:
    # marry variable value
    # Implementation for variable assignment
    mov $1, %rax
    pop %rbp
    ret

parse_function_def:
    # propose function(params): body
    # Implementation for function definition
    mov $1, %rax
    pop %rbp
    ret

parse_function_call:
    # accept function(args)
    # Implementation for function call
    mov $1, %rax
    pop %rbp
    ret

parse_if_statement:
    # argue condition: body makeup: else_body
    # Implementation for if statement
    mov $1, %rax
    pop %rbp
    ret

parse_print_statement:
    # remember expression
    # Implementation for print statement
    mov $1, %rax
    pop %rbp
    ret

# Bytecode generator
generate_bytecode:
    push %rbp
    mov %rsp, %rbp
    
    # Generate bytecode from AST
    # This is a simplified version
    
    pop %rbp
    ret

# Write output file
write_output:
    push %rbp
    mov %rsp, %rbp
    
    # Create output file
    mov $output_filename, %rdi
    mov $577, %rax       # sys_open with O_CREAT | O_WRONLY | O_TRUNC
    mov $0644, %rsi      # permissions
    syscall
    
    # Write bytecode
    mov %rax, %rdi       # file descriptor
    mov $1, %rax         # sys_write
    mov $bytecode_buffer, %rsi
    mov $bytecode_size, %rdx
    syscall
    
    # Close file
    mov $3, %rax         # sys_close
    syscall
    
    pop %rbp
    ret

# Error handlers
usage_error:
    mov $1, %rax         # sys_write
    mov $1, %rdi         # stdout
    mov $usage_msg, %rsi
    mov $usage_len, %rdx
    syscall
    
    mov $60, %rax        # sys_exit
    mov $1, %rdi
    syscall

file_open_error:
    mov $1, %rax         # sys_write
    mov $2, %rdi         # stderr
    mov $file_error, %rsi
    mov $26, %rdx
    syscall
    
    mov $60, %rax        # sys_exit
    mov $1, %rdi
    syscall

syntax_error_handler:
    mov $1, %rax         # sys_write
    mov $2, %rdi         # stderr
    mov $syntax_error, %rsi
    mov $32, %rdx
    syscall
    
    mov $60, %rax        # sys_exit
    mov $1, %rdi
    syscall

.section .data
    usage_msg: .ascii "Usage: couplescript <source_file>\n\0"
    usage_len = . - usage_msg
    output_filename: .ascii "output.csb\0"
    
    .comm bytecode_buffer, 65536
    .comm bytecode_size, 8
