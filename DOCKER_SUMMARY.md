# 🐳 Docker Support Summary for CoupleScript

## Files Added

### Core Docker Files
- **`Dockerfile`** - Main Docker image definition
- **`docker-compose.yml`** - Multi-service Docker configuration
- **`.dockerignore`** - Excludes unnecessary files from build context

### Helper Scripts
- **`docker-run.sh`** - Unix/Linux/Mac helper script
- **`docker-run.bat`** - Windows helper script

### Documentation
- **`DOCKER.md`** - Complete Docker usage guide
- **`user-programs/README.md`** - Instructions for user programs

### Test Files
- **`user-programs/docker-test.couple`** - Simple Docker test
- **`user-programs/docker-test-full.couple`** - Comprehensive Docker test

### CI/CD
- **`.github/workflows/docker.yml`** - GitHub Actions for Docker CI/CD

## Makefile Targets Added

- `make docker-build` - Build Docker image
- `make docker-run` - Run interactive CoupleScript
- `make docker-test` - Run tests in Docker
- `make docker-examples` - Run examples in Docker
- `make docker-dev` - Start development environment
- `make docker-clean` - Clean Docker resources

## Docker Services Available

1. **couplescript** - Interactive CoupleScript environment
2. **couplescript-dev** - Development environment with source mounted
3. **couplescript-test** - Test runner service
4. **couplescript-examples** - Runs all example programs

## Quick Start Commands

```bash
# Build and run (any platform with Docker)
docker build -t couplescript:latest .
docker run -it --rm couplescript:latest

# Using helper scripts
./docker-run.sh build && ./docker-run.sh run    # Linux/Mac
docker-run.bat build && docker-run.bat run      # Windows

# Using Make
make docker-build && make docker-run

# Using Docker Compose
docker-compose up couplescript
```

## Benefits

✅ **Cross-Platform**: Runs on Windows, Linux, macOS, and cloud platforms
✅ **Consistent Environment**: Same build environment everywhere
✅ **Easy Development**: Ready-to-use development environment
✅ **CI/CD Ready**: GitHub Actions integration included
✅ **Educational**: Perfect for teaching and learning environments
✅ **Isolated**: No host system dependencies
✅ **Portable**: Share development environments easily

## Use Cases

- **Development**: Consistent dev environment across teams
- **Education**: Easily distribute CoupleScript for classrooms
- **Cloud Deployment**: Deploy to any container orchestration platform
- **CI/CD**: Automated testing and building
- **Demonstration**: Quick demos without installation hassles

CoupleScript now supports Docker for maximum portability and ease of use! 💕🐳
