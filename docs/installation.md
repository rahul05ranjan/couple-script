# 💾 Installation Guide

Get CoupleScript up and running on your system in minutes! Choose your preferred installation method below.

## 🚀 Quick Installation

### One-Line Install

#### Windows (PowerShell)
```powershell
iwr -useb https://raw.githubusercontent.com/username/couplescript/main/install.bat | iex
```

#### Linux/macOS
```bash
curl -fsSL https://raw.githubusercontent.com/username/couplescript/main/quick_install.sh | bash
```

### Manual Installation

#### Prerequisites
- **Windows**: Windows 10 or later
- **Linux**: Any modern Linux distribution
- **macOS**: macOS 10.14 or later

#### Step-by-Step Instructions

**1. Download CoupleScript**
```bash
git clone https://github.com/username/couplescript.git
cd couplescript
```

**2. Build and Install**

**Windows:**
```powershell
# Run as Administrator
.\build.bat
```

**Linux/macOS:**
```bash
chmod +x install.sh
./install.sh
```

**3. Verify Installation**
```bash
couplescript --version
```

You should see:
```
CoupleScript 1.0.0 - The Programming Language for Lovers 💕
```

## 🎯 Platform-Specific Instructions

### Windows Installation

#### Method 1: One-Click Installer
1. Open PowerShell as Administrator
2. Run the installation command:
   ```powershell
   iwr -useb https://raw.githubusercontent.com/username/couplescript/main/install.bat | iex
   ```
3. Follow the prompts

#### Method 2: Manual Build
1. **Download** the repository:
   ```powershell
   git clone https://github.com/username/couplescript.git
   cd couplescript
   ```

2. **Build** the compiler and VM:
   ```powershell
   .\build.bat
   ```

3. **Add to PATH** (automatically done by installer):
   - The installer adds `C:\CoupleScript\bin` to your system PATH
   - Restart your terminal to use the `couplescript` command

#### Windows Troubleshooting
- **Permission Error**: Run PowerShell as Administrator
- **Execution Policy**: Run `Set-ExecutionPolicy RemoteSigned` first
- **Git Not Found**: Install Git from [git-scm.com](https://git-scm.com/)

### Linux Installation

#### Method 1: Quick Install Script
```bash
curl -fsSL https://raw.githubusercontent.com/username/couplescript/main/quick_install.sh | bash
```

#### Method 2: Manual Installation
1. **Install Dependencies**:
   ```bash
   # Ubuntu/Debian
   sudo apt update
   sudo apt install build-essential git

   # CentOS/RHEL/Fedora
   sudo yum groupinstall "Development Tools"
   sudo yum install git

   # Arch Linux
   sudo pacman -S base-devel git
   ```

2. **Build CoupleScript**:
   ```bash
   git clone https://github.com/username/couplescript.git
   cd couplescript
   chmod +x install.sh
   ./install.sh
   ```

3. **Add to PATH**:
   ```bash
   echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
   source ~/.bashrc
   ```

#### Linux Troubleshooting
- **Permission Denied**: Use `sudo` for system-wide installation
- **Missing Assembler**: Install `nasm` or `gas` assembler
- **Library Errors**: Install development libraries for your distribution

### macOS Installation

#### Method 1: Quick Install
```bash
curl -fsSL https://raw.githubusercontent.com/username/couplescript/main/quick_install.sh | bash
```

#### Method 2: Using Homebrew
```bash
# Add our tap (coming soon)
brew tap username/couplescript
brew install couplescript
```

#### Method 3: Manual Build
1. **Install Xcode Command Line Tools**:
   ```bash
   xcode-select --install
   ```

2. **Build CoupleScript**:
   ```bash
   git clone https://github.com/username/couplescript.git
   cd couplescript
   chmod +x install.sh
   ./install.sh
   ```

#### macOS Troubleshooting
- **Developer Tools**: Install Xcode or Command Line Tools
- **Permission Issues**: Use `sudo` if needed
- **Quarantine Warning**: Run `xattr -d com.apple.quarantine couplescript` if blocked

## 🔧 Development Installation

For contributors and developers who want to modify CoupleScript:

### Clone and Setup Development Environment
```bash
git clone https://github.com/username/couplescript.git
cd couplescript

# Build debug version
make debug

# Run tests
make test

# Install development version
make install-dev
```

### Development Dependencies
- **Assembler**: NASM (Netwide Assembler) or GNU AS
- **Make**: GNU Make for build automation
- **Git**: Version control
- **Text Editor**: VS Code recommended with CoupleScript extension

### Building Components

#### Bootstrap Compiler (Assembly)
```bash
cd bootstrap
nasm -f elf64 compiler.s -o compiler.o
nasm -f elf64 vm.s -o vm.o
ld compiler.o vm.o -o couplescript-bootstrap
```

#### Self-Hosting Compiler
```bash
# Use bootstrap to compile the self-hosting compiler
./couplescript-bootstrap couplescript-compiler.couple -o couplescript
```

#### Virtual Machine
```bash
cd bootstrap
nasm -f elf64 vm.s -o vm.o
ld vm.o -o couplescript-vm
```

## 🎮 Interactive Installation

### VS Code Extension
Install the CoupleScript extension for VS Code:

1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X)
3. Search for "CoupleScript"
4. Click Install

Features:
- Syntax highlighting
- Code completion
- Error detection
- Romantic code snippets

### Terminal Integration

#### Windows Terminal
Add CoupleScript to your terminal profile:
```json
{
    "name": "CoupleScript REPL",
    "commandline": "couplescript -i",
    "icon": "💕"
}
```

#### Bash/Zsh
Add aliases to your shell configuration:
```bash
# ~/.bashrc or ~/.zshrc
alias cs="couplescript"
alias love="couplescript -i"
alias marry="couplescript"
```

## 🐳 Docker Installation

Run CoupleScript in a container:

```bash
# Pull the official image
docker pull username/couplescript:latest

# Run interactively
docker run -it username/couplescript:latest

# Run a CoupleScript file
docker run -v $(pwd):/app username/couplescript:latest /app/my_love_story.couple
```

### Build Docker Image
```dockerfile
FROM alpine:latest
RUN apk add --no-cache nasm gcc make git
WORKDIR /usr/src/couplescript
COPY . .
RUN make install
ENTRYPOINT ["couplescript"]
```

## 📦 Package Managers

### Windows Package Managers

#### Chocolatey
```powershell
# Coming soon
choco install couplescript
```

#### Scoop
```powershell
# Coming soon
scoop bucket add couplescript https://github.com/username/scoop-couplescript
scoop install couplescript
```

### Linux Package Managers

#### APT (Ubuntu/Debian)
```bash
# Add repository (coming soon)
curl -fsSL https://packages.couplescript.org/gpg | sudo apt-key add -
echo "deb https://packages.couplescript.org/apt stable main" | sudo tee /etc/apt/sources.list.d/couplescript.list
sudo apt update
sudo apt install couplescript
```

#### YUM/DNF (RHEL/Fedora)
```bash
# Add repository (coming soon)
sudo dnf config-manager --add-repo https://packages.couplescript.org/rpm/couplescript.repo
sudo dnf install couplescript
```

#### Snap
```bash
# Coming soon
sudo snap install couplescript
```

### macOS Package Managers

#### Homebrew
```bash
# Add tap (coming soon)
brew tap username/couplescript
brew install couplescript
```

#### MacPorts
```bash
# Coming soon
sudo port install couplescript
```

## 🔧 Configuration

### Global Configuration
Create `~/.couplescript/config.json`:
```json
{
    "theme": "romantic",
    "auto_indent": true,
    "bracket_completion": true,
    "love_level": "maximum",
    "default_encoding": "utf-8",
    "tab_size": 4
}
```

### Project Configuration
Create `.couplescript.json` in your project:
```json
{
    "name": "Our Love Story",
    "version": "1.0.0",
    "entry_point": "main.couple",
    "dependencies": [],
    "romantic_mode": true
}
```

## 🧪 Testing Installation

### Quick Test
```bash
# Create a test file
echo 'remember "Hello from CoupleScript! 💕"' > test.couple

# Run the test
couplescript test.couple
```

Expected output:
```
Hello from CoupleScript! 💕
```

### Interactive Mode Test
```bash
# Start interactive mode
couplescript -i

# Type commands:
cs> marry greeting with "Hello, Love!"
cs> remember greeting
cs> exit
```

### Comprehensive Test
```bash
# Run the test suite
make test

# Or manually:
couplescript examples/hello.couple
couplescript examples/calculator.couple
couplescript examples/functions.couple
```

## 🚨 Troubleshooting

### Common Issues

#### "Command not found: couplescript"
**Solution**: Add CoupleScript to your PATH
```bash
# Check current PATH
echo $PATH

# Add CoupleScript (Linux/Mac)
export PATH=$PATH:/usr/local/bin

# Add CoupleScript (Windows)
setx PATH "%PATH%;C:\CoupleScript\bin"
```

#### "Permission denied" errors
**Solution**: Run with appropriate permissions
```bash
# Linux/Mac
sudo ./install.sh

# Windows
# Run PowerShell as Administrator
```

#### Assembly errors during build
**Solution**: Install proper assembler
```bash
# Ubuntu/Debian
sudo apt install nasm

# macOS
brew install nasm

# Windows
# Use MSYS2 or install NASM manually
```

#### "Module not found" errors
**Solution**: Verify installation paths
```bash
# Check installation
couplescript --version
couplescript --help

# Reinstall if needed
./install.sh --force
```

### Getting Help

- **Documentation**: [docs.couplescript.org](https://docs.couplescript.org)
- **GitHub Issues**: [github.com/username/couplescript/issues](https://github.com/username/couplescript/issues)
- **Community Discord**: [discord.gg/couplescript](https://discord.gg/couplescript)
- **Email Support**: support@couplescript.org

## 🔄 Updating CoupleScript

### Automatic Updates
```bash
# Check for updates
couplescript --check-updates

# Update to latest version
couplescript --update
```

### Manual Updates
```bash
# Pull latest changes
git pull origin main

# Rebuild and reinstall
make clean
make install
```

### Version Management
```bash
# List installed versions
couplescript --list-versions

# Switch version
couplescript --use-version 1.2.0

# Install specific version
curl -fsSL https://raw.githubusercontent.com/username/couplescript/v1.2.0/quick_install.sh | bash
```

## 🗑️ Uninstallation

### Remove CoupleScript
```bash
# Automated removal
curl -fsSL https://raw.githubusercontent.com/username/couplescript/main/uninstall.sh | bash

# Manual removal
sudo rm -rf /usr/local/bin/couplescript
sudo rm -rf /usr/local/share/couplescript
rm -rf ~/.couplescript
```

### Clean PATH
Remove CoupleScript from your system PATH:
```bash
# Edit your shell profile
nano ~/.bashrc  # or ~/.zshrc

# Remove the CoupleScript PATH entry
# Save and reload
source ~/.bashrc
```

---

## 🎉 Next Steps

Once installed, check out:

- [**Getting Started Guide**](GETTING_STARTED.md) - Your first CoupleScript program
- [**Language Reference**](LANGUAGE_REFERENCE.md) - Complete syntax guide  
- [**Fun Examples**](examples.md) - 20+ romantic programs to try
- [**API Documentation**](api.md) - Complete function reference

Welcome to the CoupleScript community! 💕

---

[← Back to Home](index.md) | [Getting Started →](GETTING_STARTED.md) | [Examples →](examples.md)
