@echo off
REM CoupleScript Test Runner for Windows
REM Runs comprehensive tests for the CoupleScript language

echo.
echo 💕 CoupleScript Comprehensive Test Suite 💕
echo =======================================
echo.

REM Test counters
set TOTAL_TESTS=0
set PASSED_TESTS=0
set FAILED_TESTS=0
set SKIPPED_TESTS=0

REM Function to increment test counters
goto :main

:run_test
    set test_name=%~1
    set test_file=%~2
    set expected=%~3
    
    set /a TOTAL_TESTS+=1
    
    echo 🧪 Testing: %test_name%
    
    REM Check if test file exists
    if not exist "%test_file%" (
        echo   ⚠️  SKIPPED - Test file not found: %test_file%
        set /a SKIPPED_TESTS+=1
        goto :eof
    )
    
    REM Run the test using timeout command
    timeout /t 30 >nul 2>&1
    call couplescript.bat "%test_file%" >nul 2>&1
    set exit_code=%errorlevel%
    
    REM Evaluate result based on expectation
    if "%expected%"=="pass" (
        if %exit_code%==0 (
            echo   ✅ PASSED
            set /a PASSED_TESTS+=1
        ) else (
            echo   ❌ FAILED - Expected success, got failure ^(exit code %exit_code%^)
            set /a FAILED_TESTS+=1
        )
    ) else (
        if not %exit_code%==0 (
            echo   ✅ PASSED - Expected failure detected
            set /a PASSED_TESTS+=1
        ) else (
            echo   ❌ FAILED - Expected failure, got success
            set /a FAILED_TESTS+=1
        )
    )
    echo.
goto :eof

:test_compilation
    echo 🔨 Compilation Tests
    echo Testing if programs compile successfully...
    echo.
    
    call :run_test "Hello World" "examples\hello.couple" "pass"
    call :run_test "Functions Example" "examples\functions.couple" "pass"
    call :run_test "Calculator Example" "examples\calculator.couple" "pass"
    call :run_test "Loops Example" "examples\loops.couple" "pass"
    call :run_test "Love Story Example" "examples\love_story.couple" "pass"
    
    REM Test our comprehensive test files if they exist
    if exist "tests\unit\language_features_test.couple" (
        call :run_test "Unit Tests" "tests\unit\language_features_test.couple" "pass"
    )
    if exist "tests\integration\compiler_vm_test.couple" (
        call :run_test "Integration Tests" "tests\integration\compiler_vm_test.couple" "pass"
    )
goto :eof

:test_error_handling
    echo 💔 Error Handling Tests
    echo Testing that invalid programs are properly rejected...
    echo.
    
    REM Create temporary directory and error test files
    if not exist "tests\temp" mkdir tests\temp
    
    REM Syntax error test
    echo marry incomplete_statement > tests\temp\syntax_error.couple
    call :run_test "Syntax Error Detection" "tests\temp\syntax_error.couple" "fail"
    
    REM Undefined variable test  
    echo remember undefined_variable > tests\temp\undefined_var.couple
    call :run_test "Undefined Variable Detection" "tests\temp\undefined_var.couple" "fail"
    
    REM Invalid function call test
    echo marry result accept nonexistent_function^(5^) > tests\temp\invalid_call.couple
    call :run_test "Invalid Function Call Detection" "tests\temp\invalid_call.couple" "fail"
    
    REM Clean up temporary files
    if exist "tests\temp" rmdir /s /q tests\temp
goto :eof

:test_performance
    echo ⚡ Performance Tests
    echo Testing performance with larger programs...
    echo.
    
    REM Create temporary directory and performance test
    if not exist "tests\temp" mkdir tests\temp
    
    (
        echo # Performance test - calculating fibonacci numbers
        echo propose fibonacci^(n^):
        echo     argue n ^<= 1:
        echo         promise n
        echo     makeup:
        echo         promise accept fibonacci^(n-1^) + accept fibonacci^(n-2^)
        echo.
        echo remember "Starting performance test..."
        echo marry i 1
        echo anniversary i ^<= 15:
        echo     marry result accept fibonacci^(i^)
        echo     remember "fibonacci^(" + i + "^) = " + result
        echo     marry i i + 1
        echo remember "Performance test completed!"
    ) > tests\temp\performance_test.couple
    
    echo 🏃‍♂️ Running performance test ^(Fibonacci sequence^)...
    
    REM Time the execution
    set start_time=%time%
    call couplescript.bat tests\temp\performance_test.couple >nul 2>&1
    set exit_code=%errorlevel%
    set end_time=%time%
    
    set /a TOTAL_TESTS+=1
    
    if %exit_code%==0 (
        echo   ✅ PASSED - Completed successfully
        set /a PASSED_TESTS+=1
    ) else (
        echo   ❌ FAILED - Error during execution ^(exit code %exit_code%^)
        set /a FAILED_TESTS+=1
    )
    echo.
    
    REM Clean up
    if exist "tests\temp" rmdir /s /q tests\temp
goto :eof

:test_cross_platform
    echo 🌍 Cross-Platform Tests
    echo Testing platform-specific functionality...
    echo.
    
    set /a TOTAL_TESTS+=1
    
    REM Test that the Windows batch interpreter exists
    if exist "couplescript.bat" (
        echo   ✅ PASSED - Windows batch interpreter found
        set /a PASSED_TESTS+=1
    ) else (
        echo   ❌ FAILED - Windows batch interpreter not found
        set /a FAILED_TESTS+=1
    )
    echo.
goto :eof

:show_results
    echo 💕 Test Results Summary 💕
    echo =========================
    echo.
    echo Total tests run: %TOTAL_TESTS%
    echo Passed: %PASSED_TESTS%
    echo Failed: %FAILED_TESTS%
    echo Skipped: %SKIPPED_TESTS%
    echo.
    
    if %TOTAL_TESTS% gtr 0 (
        set /a SUCCESS_RATE=(%PASSED_TESTS% * 100) / %TOTAL_TESTS%
        echo Success rate: !SUCCESS_RATE!%%
        echo.
    )
    
    if %FAILED_TESTS%==0 (
        echo 🎉 All tests passed! Love is in the air! 💕
        exit /b 0
    ) else (
        echo 💔 Some tests failed. Every relationship needs work!
        echo.
        echo Tips for fixing issues:
        echo 1. Check that CoupleScript is properly built ^(run build_windows.bat^)
        echo 2. Verify NASM is installed and in PATH
        echo 3. Check the detailed error messages above
        echo 4. Try running individual test files manually
        exit /b 1
    )
goto :eof

:main
    setlocal enabledelayedexpansion
    
    REM Check if we're in the right directory
    if not exist "Makefile" (
        echo ❌ Error: Please run this script from the CoupleScript root directory
        exit /b 1
    )
    if not exist "examples" (
        echo ❌ Error: Examples directory not found. Please run from CoupleScript root.
        exit /b 1
    )
    
    REM Check if CoupleScript is built
    echo 🔧 Checking CoupleScript build status...
    if not exist "couplescript.bat" (
        echo ⚠️  CoupleScript not built. Building now...
        call build_windows.bat
        if errorlevel 1 (
            echo ❌ Build failed. Cannot run tests.
            exit /b 1
        )
    )
    echo ✅ CoupleScript is ready
    echo.
    
    REM Run all test suites
    call :test_compilation
    call :test_error_handling  
    call :test_performance
    call :test_cross_platform
    
    REM Show final results
    call :show_results
