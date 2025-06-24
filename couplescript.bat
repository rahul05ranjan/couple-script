@echo off
echo ================================
echo CoupleScript Programming Language
echo ================================ 
echo.
if "%1"=="" (
    echo CoupleScript Interactive Mode
    echo Type 'exit' to quit
    echo.
    :interactive
    set /p input="cs> "
    if "%input%"=="exit" goto :end
    echo Interpreting: %input%
    echo (CoupleScript output would appear here)
    echo.
    goto :interactive
) else (
    echo Running CoupleScript file: %1
    echo.
    echo Reading file contents:
    type "%1"
    echo.
    echo (Compiled bytecode would execute here)
)
:end
echo Thank you for using CoupleScript
