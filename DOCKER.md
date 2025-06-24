# 🐳 Docker Support for CoupleScript

CoupleScript now supports Docker for easy deployment and cross-platform compatibility! Run CoupleScript on any system that supports Docker.

## 🚀 Quick Start with Docker

### Prerequisites
- [Docker](https://docker.com) installed on your system
- [Docker Compose](https://docs.docker.com/compose/) (usually included with Docker)

### 1. Build the Image

```bash
# Linux/Mac
./docker-run.sh build

# Windows
docker-run.bat build

# Or directly with Docker
docker build -t couplescript:latest .
```

### 2. Run CoupleScript Interactively

```bash
# Linux/Mac
./docker-run.sh run

# Windows  
docker-run.bat run

# Or directly with Docker
docker run -it --rm couplescript:latest
```

### 3. Run a CoupleScript Program

```bash
# Place your .couple file in user-programs/ directory
echo 'marry name "Docker"; remember "Hello " + name' > user-programs/hello.couple

# Linux/Mac
./docker-run.sh run hello.couple

# Windows
docker-run.bat run hello.couple
```

## 🛠️ Available Commands

### Helper Scripts

| Command | Linux/Mac | Windows | Description |
|---------|-----------|---------|-------------|
| Build | `./docker-run.sh build` | `docker-run.bat build` | Build CoupleScript Docker image |
| Run Interactive | `./docker-run.sh run` | `docker-run.bat run` | Start interactive mode |
| Run Program | `./docker-run.sh run file.couple` | `docker-run.bat run file.couple` | Run specific program |
| Development | `./docker-run.sh dev` | `docker-run.bat dev` | Start dev environment |
| Tests | `./docker-run.sh test` | `docker-run.bat test` | Run all tests |
| Examples | `./docker-run.sh examples` | `docker-run.bat examples` | Run example programs |
| Shell | `./docker-run.sh shell` | `docker-run.bat shell` | Open bash shell |
| Clean | `./docker-run.sh clean` | `docker-run.bat clean` | Clean up containers |

### Docker Compose Services

```bash
# Interactive CoupleScript
docker-compose up couplescript

# Development environment
docker-compose up couplescript-dev

# Run tests
docker-compose run couplescript-test

# Run examples
docker-compose run couplescript-examples
```

## 📁 Directory Structure

```
├── Dockerfile              # Main Docker image definition
├── docker-compose.yml      # Multi-service Docker setup
├── .dockerignore           # Files to exclude from build
├── docker-run.sh           # Helper script for Linux/Mac
├── docker-run.bat          # Helper script for Windows
└── user-programs/          # Your CoupleScript programs go here
```

## 🔧 Development with Docker

### Start Development Environment

```bash
# Linux/Mac
./docker-run.sh dev

# Windows
docker-run.bat dev

# This gives you a bash shell with:
# - Source code mounted
# - Build tools available
# - Root access for modifications
```

### Rebuild After Changes

```bash
# Rebuild the image after making changes
docker-compose build
```

## 🧪 Running Tests in Docker

```bash
# Run all tests
./docker-run.sh test        # Linux/Mac
docker-run.bat test         # Windows

# Or with docker-compose
docker-compose run couplescript-test
```

## 📚 Example Programs

Run all the fun example programs included with CoupleScript:

```bash
# Run examples
./docker-run.sh examples    # Linux/Mac  
docker-run.bat examples     # Windows

# This will run:
# - hello.couple
# - simple.couple
# - love_story.couple
# And more!
```

## 🌍 Cross-Platform Benefits

With Docker, CoupleScript runs consistently across:

- **Windows** (with Docker Desktop)
- **macOS** (with Docker Desktop)
- **Linux** (native Docker)
- **Cloud platforms** (AWS, Azure, GCP)
- **CI/CD systems** (GitHub Actions, GitLab CI, etc.)

## 🎯 Use Cases

### 1. Quick Demo
```bash
docker run -it --rm couplescript:latest
```

### 2. Development
```bash
docker-compose up couplescript-dev
```

### 3. Testing
```bash
docker-compose run couplescript-test
```

### 4. Teaching/Learning
```bash
# Share the Docker image for consistent learning environment
docker pull couplescript:latest
docker run -it couplescript:latest
```

## 🔒 Security Notes

- The container runs as a non-root user by default
- Only necessary files are included (see `.dockerignore`)
- No external network dependencies during runtime
- Source code is properly isolated

## 🐛 Troubleshooting

### Build Issues
```bash
# Clean build
docker system prune -f
docker build --no-cache -t couplescript:latest .
```

### Permission Issues on Linux
```bash
# Make sure scripts are executable
chmod +x docker-run.sh
```

### Windows Docker Issues
- Make sure Docker Desktop is running
- Enable WSL2 integration if needed
- Check that virtualization is enabled in BIOS

## 💡 Tips

1. **Volume Mounting**: The `user-programs/` directory is mounted as a volume for easy file sharing
2. **Development**: Use the dev service for active development with full source access
3. **Examples**: Start with the examples service to see CoupleScript in action
4. **Interactive Mode**: Perfect for learning and experimenting with the language

---

*Happy coding with CoupleScript in Docker! 💕🐳*
