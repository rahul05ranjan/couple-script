#!/bin/bash
# Docker helper script for CoupleScript
# Makes it easy to run CoupleScript in Docker on any platform

set -e

echo "💕 CoupleScript Docker Helper 💕"
echo "================================="

# Function to show usage
show_usage() {
    echo "Usage: $0 [command] [options]"
    echo ""
    echo "Commands:"
    echo "  build      - Build the CoupleScript Docker image"
    echo "  run        - Run CoupleScript interactively"
    echo "  dev        - Start development environment"
    echo "  test       - Run all tests"
    echo "  examples   - Run example programs"
    echo "  shell      - Open bash shell in container"
    echo "  clean      - Clean up Docker images and containers"
    echo ""
    echo "Options:"
    echo "  --help, -h - Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 build              # Build CoupleScript image"
    echo "  $0 run                # Start interactive CoupleScript"
    echo "  $0 run hello.couple   # Run a specific program"
    echo "  $0 dev                # Start development environment"
    echo "  $0 examples           # Run all example programs"
}

# Function to build Docker image
build_image() {
    echo "🔨 Building CoupleScript Docker image..."
    docker build -t couplescript:latest .
    echo "✅ Build complete!"
}

# Function to run CoupleScript interactively
run_interactive() {
    if [ $# -eq 0 ]; then
        echo "🚀 Starting CoupleScript interactive mode..."
        docker run -it --rm couplescript:latest
    else
        echo "🚀 Running CoupleScript program: $1"
        mkdir -p user-programs
        docker run -it --rm \
            -v "$(pwd)/user-programs:/couplescript/user-programs" \
            couplescript:latest ./couplescript "/couplescript/user-programs/$1"
    fi
}

# Function to start development environment
start_dev() {
    echo "🛠️ Starting CoupleScript development environment..."
    docker-compose up -d couplescript-dev
    docker exec -it couplescript-dev /bin/bash
}

# Function to run tests
run_tests() {
    echo "🧪 Running CoupleScript tests..."
    docker-compose run --rm couplescript-test
}

# Function to run examples
run_examples() {
    echo "📚 Running CoupleScript examples..."
    docker-compose run --rm couplescript-examples
}

# Function to open shell
open_shell() {
    echo "🐚 Opening shell in CoupleScript container..."
    docker run -it --rm \
        -v "$(pwd):/couplescript" \
        couplescript:latest /bin/bash
}

# Function to clean up
cleanup() {
    echo "🧹 Cleaning up Docker images and containers..."
    docker-compose down --remove-orphans
    docker system prune -f
    echo "✅ Cleanup complete!"
}

# Parse command line arguments
case "${1:-}" in
    "build")
        build_image
        ;;
    "run")
        shift
        run_interactive "$@"
        ;;
    "dev")
        start_dev
        ;;
    "test")
        run_tests
        ;;
    "examples")
        run_examples
        ;;
    "shell")
        open_shell
        ;;
    "clean")
        cleanup
        ;;
    "--help"|"-h"|"help"|"")
        show_usage
        ;;
    *)
        echo "❌ Unknown command: $1"
        echo ""
        show_usage
        exit 1
        ;;
esac
