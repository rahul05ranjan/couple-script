@echo off
REM CoupleScript Windows Setup Helper
REM This script helps you set up NASM and build CoupleScript on Windows

echo ===============================================
echo    CoupleScript Windows Setup Helper
echo ===============================================
echo.

echo Step 1: Checking for NASM...
nasm -v >nul 2>&1
if not errorlevel 1 (
    echo ✅ NASM is installed and working!
    nasm -v
    goto :check_linker
)

echo ❌ NASM not found in PATH
echo.
echo NASM Installation Instructions:
echo 1. Download NASM from: https://www.nasm.us/pub/nasm/releasebuilds/
echo 2. Choose the latest version (e.g., nasm-2.16.01-win64.zip)
echo 3. Extract to a folder like C:\nasm
echo 4. Add C:\nasm to your PATH environment variable
echo.
echo To add to PATH:
echo 1. Press Win + R, type "sysdm.cpl", press Enter
echo 2. Click "Environment Variables"
echo 3. Under "System Variables", find "Path" and click "Edit"
echo 4. Click "New" and add your NASM folder path
echo 5. Click OK on all dialogs
echo 6. Restart this command prompt
echo.
echo Alternative: Use the full path to NASM in commands
echo Example: C:\nasm\nasm.exe -v
echo.
pause
goto :end

:check_linker
echo.
echo Step 2: Checking for Microsoft linker...
link /? >nul 2>&1
if not errorlevel 1 (
    echo ✅ Microsoft linker is available!
    goto :build_couplescript
)

echo ❌ Microsoft linker not found
echo.
echo You need Visual Studio Build Tools or Visual Studio installed.
echo.
echo Options:
echo 1. Install Visual Studio Community (free): https://visualstudio.microsoft.com/vs/community/
echo 2. Install Build Tools for Visual Studio: https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2022
echo 3. Use WSL (Windows Subsystem for Linux) instead
echo.
echo For WSL option:
echo   wsl --install
echo   (restart computer when prompted)
echo   wsl -d Ubuntu
echo   sudo apt update && sudo apt install build-essential nasm
echo   make all
echo.
pause
goto :end

:build_couplescript
echo.
echo Step 3: Building CoupleScript...
echo.

echo Method 1: Using make (if available)
make -v >nul 2>&1
if not errorlevel 1 (
    echo ✅ Make is available, using make build system...
    make clean
    make all
    if not errorlevel 1 (
        echo.
        echo ✅ Build successful!
        goto :test_couplescript
    ) else (
        echo ❌ Build failed with make, trying manual build...
        goto :manual_build
    )
) else (
    echo Make not available, using manual build...
    goto :manual_build
)

:manual_build
echo.
echo Method 2: Manual build
echo.

if not exist "bootstrap" (
    echo ❌ Error: bootstrap directory not found!
    echo Make sure you're in the CoupleScript project directory.
    pause
    goto :end
)

echo Assembling compiler...
nasm -f win64 -o bootstrap\compiler.o bootstrap\compiler.s
if errorlevel 1 (
    echo ❌ Failed to assemble compiler
    pause
    goto :end
)

echo Assembling VM...
nasm -f win64 -o bootstrap\vm.o bootstrap\vm.s
if errorlevel 1 (
    echo ❌ Failed to assemble VM
    pause
    goto :end
)

echo Linking compiler...
link /subsystem:console /entry:main /out:couplescript-compiler.exe bootstrap\compiler.o
if errorlevel 1 (
    echo ❌ Failed to link compiler
    echo Try running this from a Visual Studio Developer Command Prompt
    pause
    goto :end
)

echo Linking VM...
link /subsystem:console /entry:main /out:couplescript-vm.exe bootstrap\vm.o
if errorlevel 1 (
    echo ❌ Failed to link VM
    echo Try running this from a Visual Studio Developer Command Prompt
    pause
    goto :end
)

echo Creating launcher script...
echo @echo off > couplescript.bat
echo REM CoupleScript Interpreter Launcher >> couplescript.bat
echo if "%%1"=="" ( >> couplescript.bat
echo     echo CoupleScript Interactive Mode >> couplescript.bat
echo     echo Type exit to quit >> couplescript.bat
echo     :loop >> couplescript.bat
echo     set /p line=cs^> >> couplescript.bat
echo     if "%%line%%"=="exit" goto :eof >> couplescript.bat
echo     echo %%line%% ^| couplescript-compiler.exe ^| couplescript-vm.exe >> couplescript.bat
echo     goto :loop >> couplescript.bat
echo ^) else ( >> couplescript.bat
echo     couplescript-compiler.exe "%%1" ^&^& couplescript-vm.exe output.csb >> couplescript.bat
echo ^) >> couplescript.bat

echo.
echo ✅ Build successful!

:test_couplescript
echo.
echo Step 4: Testing CoupleScript...
echo.

if not exist "examples" (
    echo Creating example directory...
    mkdir examples
)

if not exist "examples\hello.couple" (
    echo Creating hello.couple example...
    echo # Hello World in CoupleScript > examples\hello.couple
    echo marry message "Hello, World!" >> examples\hello.couple
    echo remember message >> examples\hello.couple
)

echo Testing with hello.couple...
couplescript.bat examples\hello.couple
if not errorlevel 1 (
    echo.
    echo ✅ CoupleScript is working!
    echo.
    echo Usage:
    echo   couplescript.bat examples\hello.couple    - Run a program
    echo   couplescript.bat                          - Interactive mode
    echo.
    echo Try these examples:
    if exist "examples\*.couple" (
        dir /b examples\*.couple
    )
) else (
    echo ❌ Test failed. The executables might need debugging.
)

echo.
echo Setup complete! Happy coding! 💕
pause

:end
