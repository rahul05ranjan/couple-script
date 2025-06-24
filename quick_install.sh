#!/bin/bash
# CoupleScript Quick Download and Install Script
# Usage: curl -sSL https://raw.githubusercontent.com/username/couplescript/main/quick_install.sh | bash

set -e

echo "💕 CoupleScript Quick Installer 💕"
echo "=================================="
echo ""

# Create temporary directory
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

echo "📥 Downloading CoupleScript..."

# Download method 1: Git (preferred)
if command -v git &> /dev/null; then
    git clone https://github.com/username/couplescript.git
    cd couplescript
else
    # Download method 2: curl/wget (fallback)
    if command -v curl &> /dev/null; then
        curl -L https://github.com/username/couplescript/archive/main.zip -o couplescript.zip
    elif command -v wget &> /dev/null; then
        wget https://github.com/username/couplescript/archive/main.zip -O couplescript.zip
    else
        echo "❌ Error: Need git, curl, or wget to download CoupleScript"
        exit 1
    fi
    
    # Extract zip if downloaded
    if [ -f couplescript.zip ]; then
        unzip -q couplescript.zip
        cd couplescript-main
    fi
fi

echo "✅ Download complete!"
echo ""

# Run the installer
if [ -f install.sh ]; then
    chmod +x install.sh
    ./install.sh
else
    echo "❌ Installer not found. Manual installation required."
    echo "Please visit: https://github.com/username/couplescript"
fi

# Cleanup
cd /
rm -rf "$TEMP_DIR"

echo ""
echo "🎉 CoupleScript installation complete!"
echo "💕 Happy coding with the language of love!"
