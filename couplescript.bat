@echo off
setlocal enabledelayedexpansion
REM CoupleScript Interpreter for Windows

if "%1"=="" (
    echo CoupleScript Interactive REPL
    echo Type CoupleScript commands or 'exit' to quit
    echo Examples:
    echo   remember "Hello World"
    echo   marry name "Alice"
    echo   propose greet^(^): remember "Hello!"
    echo.
    :loop
    set /p "line=cs> "
    if "!line!"=="exit" goto :eof
    call :interpret "!line!"
    goto :loop
) else (
    if exist "%1" (
        echo 💕 Running CoupleScript program: %1
        echo.
        for /f "usebackq delims=" %%A in ("%1") do (
            set "line=%%A"
            call :interpret "!line!"
        )
        echo.
        echo 💖 Program finished!
    ) else (
        echo ❌ Error: File %1 not found
    )
)
goto :eof

:interpret
set "line=%~1"

REM Skip comments and empty lines
if "!line:~0,1!"=="#" goto :eof
if "!line!"=="" goto :eof

REM Handle remember command (print)
echo !line! | findstr /i "^remember " >nul
if !errorlevel!==0 (
    set "msg=!line:remember =!"
    REM Remove surrounding quotes if present
    if "!msg:~0,1!"=="^"" if "!msg:~-1!"=="^"" set "msg=!msg:~1,-1!"
    echo !msg!
    goto :eof
)

REM Handle marry command (variable assignment)
echo !line! | findstr /i "^marry " >nul
if !errorlevel!==0 (
    echo 💒 !line!
    goto :eof
)

REM Handle argue command (if statement)
echo !line! | findstr /i "^argue " >nul
if !errorlevel!==0 (
    echo 💭 !line!
    goto :eof
)

REM Handle makeup command (else)
echo !line! | findstr /i "^makeup" >nul
if !errorlevel!==0 (
    echo 💕 !line!
    goto :eof
)

REM Handle propose command (function definition)
echo !line! | findstr /i "^propose " >nul
if !errorlevel!==0 (
    echo 💍 !line!
    goto :eof
)

REM Handle accept command (function call)
echo !line! | findstr /i "^accept " >nul
if !errorlevel!==0 (
    echo 💝 !line!
    goto :eof
)

REM Handle anniversary command (loop)
echo !line! | findstr /i "^anniversary " >nul
if !errorlevel!==0 (
    echo 🎉 !line!
    goto :eof
)

REM Handle love/hate (booleans)
echo !line! | findstr /i "love\|hate" >nul
if !errorlevel!==0 (
    echo ❤️ !line!
    goto :eof
)

REM Default: show that we're processing the line
if not "!line!"=="" (
    echo 🤔 Processing: !line!
)

goto :eof
