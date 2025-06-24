@echo off
echo CoupleScript Quick Start for Windows
echo =====================================
echo.
echo Since you have NASM installed but need a linker, 
echo here are your options:
echo.
echo Option 1: Use WSL (Recommended - Easiest!)
echo ------------------------------------------
echo 1. Open PowerShell as Administrator
echo 2. Run: wsl --install -d Ubuntu
echo 3. Restart computer when prompted
echo 4. Open Ubuntu from Start menu
echo 5. Run these commands in Ubuntu:
echo    sudo apt update
echo    sudo apt install build-essential nasm
echo    git clone https://github.com/rahul05ranjan/couple-script.git
echo    cd couple-script
echo    make all
echo    ./couplescript examples/hello.couple
echo.
echo Option 2: Install Visual Studio (Free)
echo --------------------------------------
echo 1. Download Visual Studio Community (free)
echo    https://visualstudio.microsoft.com/vs/community/
echo 2. During installation, select "C++ build tools"
echo 3. Restart this script after installation
echo.
echo Option 3: Use Online Environment
echo --------------------------------
echo 1. Open this project in GitHub Codespaces
echo 2. Everything will work instantly in the browser!
echo.
pause

echo Checking if you have WSL Ubuntu available...
wsl -d Ubuntu --exec echo "Ubuntu is ready!" 2>nul
if not errorlevel 1 (
    echo.
    echo ✅ Great! Ubuntu is available in WSL.
    echo Let's build CoupleScript in Ubuntu:
    echo.
    wsl -d Ubuntu --exec bash -c "cd /mnt/c/PROJECTS/Fun && pwd && ls -la"
    echo.
    echo To continue building:
    echo 1. wsl -d Ubuntu
    echo 2. cd /mnt/c/PROJECTS/Fun  
    echo 3. sudo apt update ^&^& sudo apt install build-essential nasm
    echo 4. make all
    echo 5. ./couplescript examples/hello.couple
) else (
    echo.
    echo To install Ubuntu in WSL:
    echo 1. Run PowerShell as Administrator
    echo 2. wsl --install -d Ubuntu
    echo 3. Restart computer
)
echo.
pause
