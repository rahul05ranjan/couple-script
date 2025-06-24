#!/bin/bash
# CoupleScript One-Click Installer for Linux/Mac
# Run this script to automatically install CoupleScript on your system

set -e  # Exit on any error

echo "💕 Welcome to the CoupleScript One-Click Installer! 💕"
echo "======================================================"
echo ""

# Detect operating system
OS=$(uname -s)
DISTRO=""

if [[ "$OS" == "Linux" ]]; then
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO=$ID
    fi
elif [[ "$OS" == "Darwin" ]]; then
    DISTRO="macos"
fi

echo "🔍 Detected OS: $OS ($DISTRO)"
echo ""

# Function to install dependencies
install_dependencies() {
    echo "📦 Installing dependencies..."
    
    case $DISTRO in
        ubuntu|debian)
            echo "Installing for Ubuntu/Debian..."
            sudo apt-get update
            sudo apt-get install -y build-essential nasm git
            ;;
        centos|rhel|fedora)
            echo "Installing for CentOS/RHEL/Fedora..."
            if command -v dnf &> /dev/null; then
                sudo dnf install -y gcc make nasm git
            else
                sudo yum install -y gcc make nasm git
            fi
            ;;
        macos)
            echo "Installing for macOS..."
            if ! command -v brew &> /dev/null; then
                echo "❌ Homebrew not found. Please install Homebrew first:"
                echo "   /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
                exit 1
            fi
            brew install nasm
            ;;
        *)
            echo "⚠️  Unknown distribution. Trying generic approach..."
            echo "Please make sure you have: gcc, make, nasm, git"
            read -p "Do you want to continue? (y/N): " -n 1 -r
            echo
            if [[ ! $REPLY =~ ^[Yy]$ ]]; then
                exit 1
            fi
            ;;
    esac
    
    echo "✅ Dependencies installed successfully!"
    echo ""
}

# Check if dependencies are already installed
check_dependencies() {
    echo "🔧 Checking dependencies..."
    
    missing_deps=()
    
    if ! command -v gcc &> /dev/null && ! command -v clang &> /dev/null; then
        missing_deps+=("C compiler (gcc/clang)")
    fi
    
    if ! command -v make &> /dev/null; then
        missing_deps+=("make")
    fi
    
    if ! command -v nasm &> /dev/null; then
        missing_deps+=("nasm")
    fi
    
    if [ ${#missing_deps[@]} -eq 0 ]; then
        echo "✅ All dependencies are already installed!"
        return 0
    else
        echo "❌ Missing dependencies: ${missing_deps[*]}"
        return 1
    fi
}

# Install CoupleScript
install_couplescript() {
    echo "💝 Building CoupleScript..."
    
    # Build the language
    make clean || true  # Don't fail if clean fails
    make all
    
    echo "✅ CoupleScript built successfully!"
    echo ""
}

# Test installation
test_installation() {
    echo "🧪 Testing CoupleScript installation..."
    
    # Create a simple test program
    cat > test_love.couple << 'EOF'
marry message "CoupleScript installation successful!"
remember message
marry love_level 100
remember "Love level: " + love_level + "%"
EOF
    
    echo "Running test program..."
    ./couplescript test_love.couple
    
    # Clean up
    rm -f test_love.couple
    
    echo "✅ Test completed successfully!"
    echo ""
}

# Create desktop shortcut (Linux only)
create_shortcuts() {
    if [[ "$OS" == "Linux" ]] && command -v desktop-file-install &> /dev/null; then
        echo "🖥️  Creating desktop shortcut..."
        
        INSTALL_DIR=$(pwd)
        DESKTOP_FILE="$HOME/.local/share/applications/couplescript.desktop"
        
        mkdir -p "$HOME/.local/share/applications"
        
        cat > "$DESKTOP_FILE" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=CoupleScript
Comment=The Romantic Programming Language
Exec=$INSTALL_DIR/couplescript
Icon=applications-development
Terminal=true
Categories=Development;IDE;
EOF
        
        echo "✅ Desktop shortcut created!"
    fi
}

# Install to system (optional)
install_system_wide() {
    echo ""
    read -p "🌟 Would you like to install CoupleScript system-wide? (y/N): " -n 1 -r
    echo
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Installing to /usr/local/bin..."
        sudo cp couplescript /usr/local/bin/
        sudo chmod +x /usr/local/bin/couplescript
        echo "✅ CoupleScript installed system-wide!"
        echo "   You can now run 'couplescript' from anywhere!"
    else
        echo "👍 Keeping CoupleScript in current directory."
        echo "   To run: ./couplescript"
    fi
}

# Main installation process
main() {
    echo "Starting CoupleScript installation..."
    echo ""
    
    # Check if we're in the right directory
    if [ ! -f "Makefile" ] || [ ! -f "couplescript-compiler.couple" ]; then
        echo "❌ Error: Please run this script from the CoupleScript directory"
        echo "   (The directory should contain Makefile and couplescript-compiler.couple)"
        exit 1
    fi
    
    # Check and install dependencies
    if ! check_dependencies; then
        echo ""
        read -p "📥 Install missing dependencies automatically? (Y/n): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Nn]$ ]]; then
            install_dependencies
        else
            echo "Please install the missing dependencies manually and run this script again."
            exit 1
        fi
    fi
    
    echo ""
    
    # Build CoupleScript
    install_couplescript
    
    # Test the installation
    test_installation
    
    # Create shortcuts
    create_shortcuts
    
    # Offer system-wide installation
    install_system_wide
    
    echo ""
    echo "🎉 CoupleScript Installation Complete! 🎉"
    echo "=========================================="
    echo ""
    echo "💕 Your romantic programming language is ready!"
    echo ""
    echo "Quick start:"
    echo "  ./couplescript examples/hello.couple      # Run a program"
    echo "  ./couplescript -i                     # Interactive mode"
    echo ""
    echo "📚 Learn more:"
    echo "  📖 INSTALLATION.md     - Complete guide"
    echo "  📖 LANGUAGE_REFERENCE.md - Language documentation"
    echo "  💝 examples/           - Sample love stories in code"
    echo ""
    echo "Happy coding, and may your programs be as beautiful as your love story! 💕✨"
}

# Run the installer
main "$@"
