@echo off
REM Docker helper script for CoupleScript on Windows
REM Makes it easy to run CoupleScript in Docker on Windows

echo 💕 CoupleScript Docker Helper for Windows 💕
echo =============================================

if "%1"=="" goto usage
if "%1"=="help" goto usage
if "%1"=="--help" goto usage
if "%1"=="-h" goto usage

if "%1"=="build" goto build
if "%1"=="run" goto run
if "%1"=="dev" goto dev
if "%1"=="test" goto test
if "%1"=="examples" goto examples
if "%1"=="shell" goto shell
if "%1"=="clean" goto clean

echo ❌ Unknown command: %1
echo.
goto usage

:usage
echo Usage: %0 [command] [options]
echo.
echo Commands:
echo   build      - Build the CoupleScript Docker image
echo   run        - Run CoupleScript interactively
echo   dev        - Start development environment
echo   test       - Run all tests
echo   examples   - Run example programs
echo   shell      - Open bash shell in container
echo   clean      - Clean up Docker images and containers
echo.
echo Examples:
echo   %0 build              # Build CoupleScript image
echo   %0 run                # Start interactive CoupleScript
echo   %0 run hello.couple   # Run a specific program
echo   %0 dev                # Start development environment
echo   %0 examples           # Run all example programs
goto end

:build
echo 🔨 Building CoupleScript Docker image...
docker build -t couplescript:latest .
if %errorlevel% equ 0 (
    echo ✅ Build complete!
) else (
    echo ❌ Build failed!
)
goto end

:run
if "%2"=="" (
    echo 🚀 Starting CoupleScript interactive mode...
    docker run -it --rm couplescript:latest
) else (
    echo 🚀 Running CoupleScript program: %2
    if not exist user-programs mkdir user-programs
    docker run -it --rm -v "%cd%/user-programs:/couplescript/user-programs" couplescript:latest ./couplescript /couplescript/user-programs/%2
)
goto end

:dev
echo 🛠️ Starting CoupleScript development environment...
docker-compose up -d couplescript-dev
docker exec -it couplescript-dev /bin/bash
goto end

:test
echo 🧪 Running CoupleScript tests...
docker-compose run --rm couplescript-test
goto end

:examples
echo 📚 Running CoupleScript examples...
docker-compose run --rm couplescript-examples
goto end

:shell
echo 🐚 Opening shell in CoupleScript container...
docker run -it --rm -v "%cd%:/couplescript" couplescript:latest /bin/bash
goto end

:clean
echo 🧹 Cleaning up Docker images and containers...
docker-compose down --remove-orphans
docker system prune -f
echo ✅ Cleanup complete!
goto end

:end
