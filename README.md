# 💕 CoupleScript Programming Language

*The world's most romantic programming language - where every program is a love story!*

[![License: MIT](https://img.shields.io/badge/License-MIT-pink.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Linux%20%7C%20macOS-lightgrey.svg)](https://github.com/rahul05ranjan/couple-script)
[![Language](https://img.shields.io/badge/Language-CoupleScript-ff69b4.svg)](https://github.com/rahul05ranjan/couple-script)
[![Build Status](https://img.shields.io/badge/Build-Passing-brightgreen.svg)](https://github.com/rahul05ranjan/couple-script)
[![Love Level](https://img.shields.io/badge/Love%20Level-100%25-red.svg?style=flat&logo=heart)](https://github.com/rahul05ranjan/couple-script)
[![Documentation](https://img.shields.io/badge/docs-GitHub_Pages-blue.svg)](https://rahul05ranjan.github.io/couple-script)

## 🌐 **[📖 Complete Documentation Website →](https://rahul05ranjan.github.io/couple-script)**

Explore our beautiful documentation site with installation guides, API reference, and 20+ fun examples!

## 🌟 What is CoupleScript?

CoupleScript is a fun, relationship-themed programming language that uses marriage and love metaphors to make programming more enjoyable and relatable. Built completely from scratch with no dependencies on existing languages!

```couplescript
# Your first love story in code! 💕
marry husband "Alex"
marry wife "Emma"

remember "Meet our lovely couple: " + husband + " and " + wife

argue love:
    remember "They lived happily ever after! 🎉"
    anniversary year in couple[1, 2, 3, 4, 5]:
        remember "Year " + year + ": Still in love! 💖"
makeup:
    remember "Every relationship has its challenges... 💪"
```

## 🚀 Features

- 💝 **Completely Independent** - No Python, C, or JavaScript dependencies
- 🎭 **Relationship-Themed Keywords** - `marry`, `propose`, `accept`, `argue`, `makeup`, `remember`
- 🔧 **Self-Hosting** - Compiler written in CoupleScript itself!
- ⚡ **Fast** - Assembly-based virtual machine
- 🌍 **Cross-Platform** - Windows, Linux, macOS
- 📚 **Educational** - Learn programming through romantic metaphors
- 🎮 **Interactive REPL** - Live coding environment
- 💖 **Fun** - Makes programming enjoyable for everyone!

## Language Features

### Keywords & Concepts
- `marry` - Variable declaration/assignment
- `divorce` - Variable deletion
- `propose` - Function definition
- `accept` - Function call
- `argue` - Conditional statements (if)
- `makeup` - Else clause
- `remember` - Print/output
- `forget` - Clear/reset
- `promise` - Return statement
- `anniversary` - Loop
- `separate` - Break
- `together` - Block grouping

### Data Types
- `love` - Boolean true
- `hate` - Boolean false
- `heart` - Numbers
- `words` - Strings
- `couple` - Arrays/Lists
- `memory` - Objects/Dictionaries

## Quick Start

```couplescript
# Variable declaration
marry name "Alice"
marry age 25

# Function definition
propose greet(person):
    remember "Hello, " + person + "!"

# Function call
accept greet(name)

# Conditional logic
argue age > 18:
    remember "Adult"
makeup:
    remember "Minor"

# Loops
anniversary i in couple[1, 2, 3, 4, 5]:
    remember i
```

## 🚀 Super Easy Installation

### 🎯 Prerequisites

**Windows:**
- Install [NASM](https://www.nasm.us/pub/nasm/releasebuilds/) assembler
- Install Visual Studio Build Tools or use WSL

**Linux/Mac:**
```bash
# Ubuntu/Debian
sudo apt-get install build-essential nasm

# macOS
xcode-select --install  # Optional: brew install nasm
```

### 🏃‍♂️ Build & Run

**All Platforms:**
```bash
# 1. Clone the repository
git clone https://github.com/rahul05ranjan/couple-script.git
cd couple-script

# 2. Build CoupleScript
make all

# 3. Start coding in love!
# Windows:
couplescript.bat examples/hello.couple    # Run a program
couplescript.bat                          # Interactive mode

# Linux/Mac:
./couplescript examples/hello.couple      # Run a program
./couplescript                            # Interactive mode
```

**Windows Alternative:**
```batch
# Easy Windows build script
build_windows.bat
```

### 📖 Need Help?

- **[INSTALLATION.md](INSTALLATION.md)** - Complete setup guide with troubleshooting
- **[LANGUAGE_REFERENCE.md](LANGUAGE_REFERENCE.md)** - Learn the CoupleScript syntax

### 🚨 Windows Users Quick Setup

**Option 1: Install Native Tools**
1. Install [NASM](https://www.nasm.us/pub/nasm/releasebuilds/) - download and add to PATH
2. Install [Visual Studio Build Tools](https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2022)
3. Run: `build_windows.bat` or `make all`

**Option 2: Use WSL (Recommended for ease)**
1. Install WSL: `wsl --install` (restart required)
2. In WSL: `sudo apt update && sudo apt install build-essential nasm`
3. In WSL: `make all`

**Option 3: GitHub Codespaces/Online**
- Open this repo in GitHub Codespaces - everything works out of the box!

## Examples

See the `examples/` directory for sample programs demonstrating various features of CoupleScript.

## Architecture

- `lexer.couple` - Tokenizes CoupleScript source code (written in CoupleScript itself!)
- `parser.couple` - Parses tokens into an Abstract Syntax Tree
- `vm.couple` - Virtual machine that executes CoupleScript bytecode
- `compiler.couple` - Compiles AST to bytecode
- `runtime.couple` - Runtime system and memory management
- `bootstrap/` - Initial bootstrap compiler written in assembly
- `Makefile` - Build system

## 🤝 Contributing

We love contributions from the community! CoupleScript is all about spreading love through code, and we'd love your help to make it even better. Whether you're a seasoned developer or just starting your coding journey, there are many ways to contribute! 💕

**👉 [Read our detailed Contributing Guide](CONTRIBUTING.md) for complete instructions!**

### 🌟 Quick Ways to Contribute

#### 🐛 **Bug Reports & Feature Requests**
- Found a bug? [Open an issue](https://github.com/rahul05ranjan/couple-script/issues/new/choose)
- Have a romantic feature idea? We'd love to hear it!
- Improve documentation or add more examples

#### 💻 **Code Contributions**
- Add new relationship-themed keywords or functions
- Improve the compiler or virtual machine
- Create fun example programs
- Enhance error messages to be more user-friendly
- Add support for new platforms

#### 📚 **Documentation & Examples**
- Write tutorials or blog posts
- Create more fun example programs
- Improve installation guides
- Add translations for documentation

### 🚀 Quick Start for Contributors

#### 1. **Fork & Clone**
```bash
# Fork the repository on GitHub, then:
git clone https://github.com/YOUR_USERNAME/couple-script.git
cd couple-script
git remote add upstream https://github.com/rahul05ranjan/couple-script.git
```

#### 2. **Set Up Development Environment**
```bash
# Install dependencies (Linux/macOS)
sudo apt-get install build-essential nasm  # Ubuntu/Debian
# or: brew install nasm                     # macOS

# Build the project
make all

# Test your setup
make test
./couplescript examples/hello.couple
```

#### 3. **Create Your Feature Branch**
```bash
git checkout -b feature/amazing-romantic-feature
# or: git checkout -b fix/some-bug-fix
```

#### 4. **Make Your Changes**
- Write your code with love! 💖
- Follow the existing code style
- Add comments explaining your romantic logic
- Create or update examples if needed

#### 5. **Test Your Changes**

```bash
# Build and test
make clean && make all
make test

# Test your specific changes
# Windows:
couplescript.bat your_test_program.couple
# Linux/macOS:
./couplescript your_test_program.couple
```

#### 6. **Commit Your Love**
```bash
git add .
git commit -m "Add amazing romantic feature that makes coding more lovely"
```

#### 7. **Push & Create Pull Request**
```bash
git push origin feature/amazing-romantic-feature
```
Then create a Pull Request on GitHub with:
- Clear description of your changes
- Why this makes CoupleScript more romantic/better
- Any testing you've done

### 🎯 Contribution Ideas

#### 🆕 **Easy (Good First Issues)**
- Add new example programs (love poems, date planners, etc.)
- Improve error messages to be more romantic
- Add more relationship-themed built-in functions
- Fix typos in documentation
- Add unit tests for existing features

#### 🔧 **Intermediate**
- Implement new language features (e.g., `engagement` for constants)
- Improve the REPL experience
- Add debugging capabilities
- Create a VS Code extension with syntax highlighting
- Implement more data structures (e.g., `wedding_guest_list`)

#### 🚀 **Advanced**
- Optimize the virtual machine performance
- Add networking capabilities for "long-distance relationships"
- Create a package manager for CoupleScript libraries
- Implement compilation to native machine code
- Add support for concurrent "relationships" (threading)

### 📋 Code Guidelines

#### **Romantic Coding Standards**
- Use relationship metaphors consistently
- Write code that tells a love story
- Comment your code as if explaining to your significant other
- Test thoroughly - we want stable relationships! 
- Keep functions small and focused (like perfect date plans)

#### **Naming Conventions**
- Variables: `camelCase` (e.g., `myLoveStory`, `firstDate`)
- Functions: `snake_case` with romantic names (e.g., `propose_marriage`, `calculate_love_score`)
- Constants: `UPPER_CASE` (e.g., `ETERNAL_LOVE`, `MAX_ROMANCE_LEVEL`)

#### **Example Code Style**
```couplescript
# Good: Romantic and clear
marry couple_names couple["Alice", "Bob"]
propose plan_perfect_date(location, activity):
    marry date_plan memory[
        "location": location,
        "activity": activity,
        "romance_level": 100
    ]
    promise date_plan

# Comments should be loving and helpful
# This function calculates the compatibility between two people
propose calculate_compatibility(person1, person2):
    # Love always finds a way! 💕
    promise love
```

### 🏆 Recognition

Contributors will be:
- ✨ Added to our Hall of Love (contributors list)
- 💕 Mentioned in release notes
- 🌟 Given special romantic titles based on contributions
- 💖 Invited to help shape the future of CoupleScript

### 💬 Community & Support

- **Discord**: [Join our romantic coding community](#) (coming soon!)
- **GitHub Discussions**: [Share ideas and get help](https://github.com/rahul05ranjan/couple-script/discussions)
- **Issues**: [Report bugs or request features](https://github.com/rahul05ranjan/couple-script/issues)

### 📜 Code of Conduct

We're committed to providing a welcoming and inclusive environment. Please:
- Be respectful and kind (like in any good relationship)
- Help others learn and grow
- Embrace diversity and different perspectives
- Keep discussions constructive and romantic! 💕

**Remember: In code as in love, every contribution matters!** 💖

---

*Ready to contribute? We can't wait to see what romantic features you'll bring to CoupleScript!*

## License

MIT License - Feel free to use this for educational purposes or just for fun!
