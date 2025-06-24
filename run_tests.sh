#!/bin/bash
# CoupleScript Test Runner Script
# Runs comprehensive tests for the CoupleScript language

# Colors for romantic output
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
PINK='\033[95m'
CYAN='\033[96m'
RESET='\033[0m'

# Test counters
TOTAL_TESTS=0
PASSED_TESTS=0
FAILED_TESTS=0
SKIPPED_TESTS=0

echo -e "${PINK}💕 CoupleScript Comprehensive Test Suite 💕${RESET}"
echo -e "${PINK}=======================================${RESET}"
echo ""

# Function to run a single test
run_test() {
    local test_name="$1"
    local test_file="$2"
    local expected_result="$3"  # "pass" or "fail"
    
    TOTAL_TESTS=$((TOTAL_TESTS + 1))
    
    echo -e "🧪 Testing: ${CYAN}$test_name${RESET}"
    
    # Check if test file exists
    if [[ ! -f "$test_file" ]]; then
        echo -e "  ⚠️  ${YELLOW}SKIPPED${RESET} - Test file not found: $test_file"
        SKIPPED_TESTS=$((SKIPPED_TESTS + 1))
        return
    fi
    
    # Run the test using the CoupleScript interpreter
    if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
        # Windows
        timeout 30 ./couplescript.bat "$test_file" > /dev/null 2>&1
    else
        # Linux/macOS
        timeout 30 ./couplescript "$test_file" > /dev/null 2>&1
    fi
    
    local exit_code=$?
    
    # Evaluate result based on expectation
    if [[ "$expected_result" == "pass" && $exit_code -eq 0 ]]; then
        echo -e "  ✅ ${GREEN}PASSED${RESET}"
        PASSED_TESTS=$((PASSED_TESTS + 1))
    elif [[ "$expected_result" == "fail" && $exit_code -ne 0 ]]; then
        echo -e "  ✅ ${GREEN}PASSED${RESET} (Expected failure detected)"
        PASSED_TESTS=$((PASSED_TESTS + 1))
    else
        echo -e "  ❌ ${RED}FAILED${RESET}"
        FAILED_TESTS=$((FAILED_TESTS + 1))
        
        # Show detailed error for debugging
        if [[ "$expected_result" == "pass" ]]; then
            echo -e "    Expected: Success, Got: Failure (exit code $exit_code)"
        else
            echo -e "    Expected: Failure, Got: Success"
        fi
    fi
    echo ""
}

# Function to run compilation tests
test_compilation() {
    echo -e "${PINK}🔨 Compilation Tests${RESET}"
    echo "Testing if programs compile successfully..."
    echo ""
    
    # Test basic examples
    run_test "Hello World" "examples/hello.couple" "pass"
    run_test "Functions Example" "examples/functions.couple" "pass"
    run_test "Calculator Example" "examples/calculator.couple" "pass"
    run_test "Loops Example" "examples/loops.couple" "pass"
    run_test "Love Story Example" "examples/love_story.couple" "pass"
    
    # Test our comprehensive test files
    run_test "Unit Tests" "tests/unit/language_features_test.couple" "pass"
    run_test "Integration Tests" "tests/integration/compiler_vm_test.couple" "pass"
}

# Function to test error handling
test_error_handling() {
    echo -e "${PINK}💔 Error Handling Tests${RESET}"
    echo "Testing that invalid programs are properly rejected..."
    echo ""
    
    # Create temporary error test files
    mkdir -p tests/temp
    
    # Syntax error test
    echo 'marry incomplete_statement' > tests/temp/syntax_error.couple
    run_test "Syntax Error Detection" "tests/temp/syntax_error.couple" "fail"
    
    # Undefined variable test
    echo 'remember undefined_variable' > tests/temp/undefined_var.couple
    run_test "Undefined Variable Detection" "tests/temp/undefined_var.couple" "fail"
    
    # Invalid function call test
    echo 'marry result accept nonexistent_function(5)' > tests/temp/invalid_call.couple
    run_test "Invalid Function Call Detection" "tests/temp/invalid_call.couple" "fail"
    
    # Clean up temporary files
    rm -rf tests/temp
}

# Function to test performance
test_performance() {
    echo -e "${PINK}⚡ Performance Tests${RESET}"
    echo "Testing performance with larger programs..."
    echo ""
    
    # Create a performance test
    mkdir -p tests/temp
    
    cat > tests/temp/performance_test.couple << 'EOF'
# Performance test - calculating many fibonacci numbers
propose fibonacci(n):
    argue n <= 1:
        promise n
    makeup:
        promise accept fibonacci(n-1) + accept fibonacci(n-2)

remember "Starting performance test..."
marry i 1
anniversary i <= 20:
    marry result accept fibonacci(i)
    remember "fibonacci(" + i + ") = " + result
    marry i i + 1
remember "Performance test completed!"
EOF
    
    echo "🏃‍♂️ Running performance test (Fibonacci sequence)..."
    
    # Time the execution
    if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
        # Windows
        start_time=$(date +%s)
        timeout 60 ./couplescript.bat tests/temp/performance_test.couple > /dev/null 2>&1
        exit_code=$?
        end_time=$(date +%s)
    else
        # Linux/macOS
        start_time=$(date +%s)
        timeout 60 ./couplescript tests/temp/performance_test.couple > /dev/null 2>&1
        exit_code=$?
        end_time=$(date +%s)
    fi
    
    duration=$((end_time - start_time))
    
    if [[ $exit_code -eq 0 ]]; then
        echo -e "  ✅ ${GREEN}PASSED${RESET} (Completed in ${duration}s)"
        PASSED_TESTS=$((PASSED_TESTS + 1))
    elif [[ $exit_code -eq 124 ]]; then
        echo -e "  ⏰ ${YELLOW}TIMEOUT${RESET} (Exceeded 60s limit)"
        FAILED_TESTS=$((FAILED_TESTS + 1))
    else
        echo -e "  ❌ ${RED}FAILED${RESET} (Error during execution)"
        FAILED_TESTS=$((FAILED_TESTS + 1))
    fi
    
    TOTAL_TESTS=$((TOTAL_TESTS + 1))
    echo ""
    
    # Clean up
    rm -rf tests/temp
}

# Function to test cross-platform compatibility
test_cross_platform() {
    echo -e "${PINK}🌍 Cross-Platform Tests${RESET}"
    echo "Testing platform-specific functionality..."
    echo ""
    
    # Test that the interpreter exists and is executable
    if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
        if [[ -f "couplescript.bat" ]]; then
            echo -e "  ✅ ${GREEN}PASSED${RESET} - Windows batch interpreter found"
            PASSED_TESTS=$((PASSED_TESTS + 1))
        else
            echo -e "  ❌ ${RED}FAILED${RESET} - Windows batch interpreter not found"
            FAILED_TESTS=$((FAILED_TESTS + 1))
        fi
    else
        if [[ -x "couplescript" ]]; then
            echo -e "  ✅ ${GREEN}PASSED${RESET} - Unix interpreter found and executable"
            PASSED_TESTS=$((PASSED_TESTS + 1))
        else
            echo -e "  ❌ ${RED}FAILED${RESET} - Unix interpreter not found or not executable"
            FAILED_TESTS=$((FAILED_TESTS + 1))
        fi
    fi
    
    TOTAL_TESTS=$((TOTAL_TESTS + 1))
    echo ""
}

# Function to show final results
show_results() {
    echo -e "${PINK}💕 Test Results Summary 💕${RESET}"
    echo -e "${PINK}=========================${RESET}"
    echo ""
    echo "Total tests run: $TOTAL_TESTS"
    echo -e "${GREEN}Passed: $PASSED_TESTS${RESET}"
    echo -e "${RED}Failed: $FAILED_TESTS${RESET}"
    echo -e "${YELLOW}Skipped: $SKIPPED_TESTS${RESET}"
    echo ""
    
    if [[ $TOTAL_TESTS -gt 0 ]]; then
        SUCCESS_RATE=$(( (PASSED_TESTS * 100) / TOTAL_TESTS ))
        echo "Success rate: $SUCCESS_RATE%"
        echo ""
    fi
    
    if [[ $FAILED_TESTS -eq 0 ]]; then
        echo -e "${GREEN}🎉 All tests passed! Love is in the air! 💕${RESET}"
        exit 0
    else
        echo -e "${RED}💔 Some tests failed. Every relationship needs work!${RESET}"
        echo ""
        echo "Tips for fixing issues:"
        echo "1. Check that CoupleScript is properly built (run 'make all')"
        echo "2. Verify all dependencies are installed"
        echo "3. Check the detailed error messages above"
        echo "4. Try running individual test files manually"
        exit 1
    fi
}

# Main test execution
main() {
    # Check if we're in the right directory
    if [[ ! -f "Makefile" || ! -d "examples" ]]; then
        echo -e "${RED}❌ Error: Please run this script from the CoupleScript root directory${RESET}"
        exit 1
    fi
    
    # Check if CoupleScript is built
    echo "🔧 Checking CoupleScript build status..."
    if ! make -q all 2>/dev/null; then
        echo "⚠️  CoupleScript not built or out of date. Building now..."
        if ! make all; then
            echo -e "${RED}❌ Build failed. Cannot run tests.${RESET}"
            exit 1
        fi
    fi
    echo -e "${GREEN}✅ CoupleScript is built and ready${RESET}"
    echo ""
    
    # Run all test suites
    test_compilation
    test_error_handling
    test_performance
    test_cross_platform
    
    # Show final results
    show_results
}

# Run main function
main "$@"
