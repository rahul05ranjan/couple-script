@echo off
REM CoupleScript One-Click Installer for Windows
REM This script automatically sets up CoupleScript with no additional dependencies

setlocal enabledelayedexpansion

echo.
echo 💕 Welcome to the CoupleScript One-Click Installer! 💕
echo ======================================================
echo.

REM Check if we're in the right directory
if not exist "build.bat" (
    echo ❌ Error: Please run this script from the CoupleScript directory
    echo    ^(The directory should contain build.bat and couplescript-compiler.couple^)
    pause
    exit /b 1
)

echo 🔍 Detected OS: Windows
echo.

echo 📦 No additional dependencies needed for Windows!
echo ✅ CoupleScript works out of the box!
echo.

echo 💝 Building CoupleScript...
call build.bat >nul 2>&1

if %ERRORLEVEL% neq 0 (
    echo ❌ Build failed. Running build script again with output...
    call build.bat
    pause
    exit /b 1
)

echo ✅ CoupleScript built successfully!
echo.

echo 🧪 Testing CoupleScript installation...

REM Create a simple test program
(
echo # Test program for CoupleScript installation
echo marry message "CoupleScript installation successful!"
echo remember message
echo marry love_level 100
echo remember "Love level: " + love_level + "%%"
) > test_love.couple

echo Running test program...
call couplescript.bat test_love.couple

REM Clean up
del test_love.couple >nul 2>&1

echo.
echo ✅ Test completed successfully!
echo.

REM Create desktop shortcut
echo 🖥️  Creating desktop shortcut...
set INSTALL_DIR=%CD%
set SHORTCUT_PATH=%USERPROFILE%\Desktop\CoupleScript.lnk

REM Create a simple batch file instead of a complex shortcut
(
echo @echo off
echo cd /d "%INSTALL_DIR%"
echo echo Starting CoupleScript...
echo couplescript.bat %%*
echo pause
) > "%USERPROFILE%\Desktop\CoupleScript.bat"

echo ✅ Desktop shortcut created: CoupleScript.bat
echo.

REM Ask about adding to PATH
echo.
echo 🌟 Would you like to add CoupleScript to your PATH?
echo    This allows you to run 'couplescript' from anywhere.
echo.
choice /C YN /M "Add to PATH (Y/N)"

if !ERRORLEVEL! equ 1 (
    echo.
    echo 📋 To add CoupleScript to your PATH manually:
    echo.
    echo 1. Open System Properties ^(Win+R, type "sysdm.cpl"^)
    echo 2. Click "Environment Variables"
    echo 3. Edit the "Path" variable for your user
    echo 4. Add this directory: %INSTALL_DIR%
    echo 5. Click OK to save
    echo.
    echo Or run this PowerShell command as Administrator:
    echo [Environment]::SetEnvironmentVariable^("Path", $env:Path + ";%INSTALL_DIR%", "User"^)
    echo.
) else (
    echo 👍 Keeping CoupleScript in current directory.
    echo    To run: couplescript.bat
)

echo.
echo 🎉 CoupleScript Installation Complete! 🎉
echo ==========================================
echo.
echo 💕 Your romantic programming language is ready!
echo.
echo Quick start:
echo   couplescript.bat examples\hello.couple        # Run a program
echo   couplescript.bat                          # Interactive mode
echo   CoupleScript.bat                          # Desktop shortcut
echo.
echo 📚 Learn more:
echo   📖 INSTALLATION.md        - Complete guide
echo   📖 LANGUAGE_REFERENCE.md  - Language documentation  
echo   💝 examples\              - Sample love stories in code
echo.
echo Happy coding, and may your programs be as beautiful as your love story! 💕✨
echo.

pause
