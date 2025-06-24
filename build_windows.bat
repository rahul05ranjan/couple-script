@echo off
REM CoupleScript Windows Build Script
REM This script builds CoupleScript on Windows using NASM and Microsoft linker

echo CoupleScript Windows Build Script
echo ================================

REM Check if NASM is available
nasm -v >nul 2>&1
if errorlevel 1 (
    echo ERROR: NASM not found!
    echo Please install NASM from https://www.nasm.us/pub/nasm/releasebuilds/
    echo Make sure it's in your PATH
    pause
    exit /b 1
)

REM Check if Microsoft linker is available
link /? >nul 2>&1
if errorlevel 1 (
    echo ERROR: Microsoft linker not found!
    echo Please install Visual Studio Build Tools or Visual Studio
    echo Or run this from a Visual Studio Developer Command Prompt
    pause
    exit /b 1
)

echo Building CoupleScript...
echo.

REM Use make if available, otherwise manual build
make -v >nul 2>&1
if not errorlevel 1 (
    echo Using make build system...
    make all
    if errorlevel 1 (
        echo Build failed!
        pause
        exit /b 1
    )
) else (
    echo Make not available, building manually...
    echo.
    
    echo Assembling compiler.s...
    nasm -f win64 -o bootstrap\compiler.o bootstrap\compiler.s
    if errorlevel 1 goto error
    
    echo Assembling vm.s...
    nasm -f win64 -o bootstrap\vm.o bootstrap\vm.s
    if errorlevel 1 goto error
    
    echo Linking compiler...
    link /subsystem:console /entry:main /out:couplescript-compiler.exe bootstrap\compiler.o
    if errorlevel 1 goto error
    
    echo Linking VM...
    link /subsystem:console /entry:main /out:couplescript-vm.exe bootstrap\vm.o
    if errorlevel 1 goto error
    
    echo Creating launcher script...
    echo @echo off > couplescript.bat
    echo REM CoupleScript Interpreter Launcher for Windows >> couplescript.bat
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
)

echo.
echo Build successful!
echo.
echo Usage:
echo   couplescript.bat examples/hello.couple  - Run a program
echo   couplescript.bat                        - Interactive mode
echo.
echo Try running: couplescript.bat examples/hello.couple
echo.
pause
exit /b 0

:error
echo.
echo Build failed! Please check the error messages above.
pause
exit /b 1
