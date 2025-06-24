# 💕 CoupleScript Installation & Quick Start Guide

Welcome to CoupleScript - the most romantic programming language ever created! This guide will help you get CoupleScript up and running on your system.

## 🚀 Quick Start (Recommended)

### Option 1: Windows Users (Easiest!)

1. **Download the project** (no additional software needed!)   ```bash
   # Clone or download the CoupleScript project
   git clone https://github.com/rahul05ranjan/couple-script.git
   cd couple-script
   ```

2. **Run the build script**

   ```bash
   make all
   ```

3. **Start coding in love!**

   ```bash
   # Run an example program
   ./couplescript examples/hello.couple
   
   # Or start interactive mode
   ./couplescript
   ```

That's it! No compilers, no dependencies - just pure romance! 💖

### Option 2: Linux/Mac Users

1. **Install build tools** (one-time setup)
   ```bash
   # Ubuntu/Debian
   sudo apt-get install build-essential nasm
   
   # CentOS/RHEL
   sudo yum install gcc nasm
   
   # macOS (with Homebrew)
   brew install nasm
   ```

2. **Build CoupleScript**
   ```bash
   make all
   ```

3. **Start your love story**
   ```bash
   # Run an example
   ./couplescript examples/hello.couple
   
   # Interactive mode
   ./couplescript -i
   ```

## 📦 What You Get

After installation, you'll have:
- 💕 **CoupleScript Interpreter** - Run your romantic programs
- 📝 **Example Programs** - Learn from love stories in code
- 📚 **Language Reference** - Complete documentation
- 🛠️ **Self-Hosting Compiler** - The language compiles itself!

## 🎯 Your First CoupleScript Program

Create a file called `my_love_story.couple`:

```couplescript
# My first CoupleScript program!
marry my_name "Your Name"
marry partner_name "Your Partner"

remember "💕 Welcome to our love story!"
remember "Meet " + my_name + " and " + partner_name

argue love:
    remember "They lived happily ever after! 🎉"
makeup:
    remember "Every relationship has its moments... 💪"

# Create a couple (array) of their favorite things
marry favorite_things couple["Pizza", "Movies", "Travel", "Dancing"]

remember "Things they love to do together:"
anniversary activity in favorite_things:
    remember "  💝 " + activity
```

Run it:
```bash
# Windows
.\couplescript.bat my_love_story.couple

# Linux/Mac
./couplescript my_love_story.couple
```

## 🔧 Advanced Installation (For Full Assembly Power)

If you want the complete, independent assembly implementation:

### Prerequisites
- **NASM Assembler** (for Windows: download from nasm.us)
- **GNU Assembler** (Linux/Mac: usually included with build tools)
- **Linker** (ld on Linux/Mac, link.exe on Windows)

### Full Build Process
```bash
# Linux/Mac
make clean      # Clean previous builds
make bootstrap  # Build assembly bootstrap
make compiler   # Build self-hosting compiler
make vm        # Build virtual machine
make all       # Complete build

# Windows (with NASM installed)
build_full.bat  # Complete assembly build
```

## 📖 Usage Examples

### Interactive Mode
```bash
$ ./couplescript
CoupleScript v1.0 - Interactive Mode
cs> marry name "Alice"
cs> remember "Hello, " + name + "!"
Hello, Alice!
cs> exit
```

### Running Files
```bash
# Basic program
./couplescript examples/hello.couple

# Complex examples
./couplescript examples/marriage_story.couple
./couplescript examples/calculator.couple
./couplescript examples/functions.couple
```

### Batch Processing
```bash
# Run multiple programs
for file in examples/*.couple; do
    echo "Running $file..."
    ./couplescript "$file"
    echo "---"
done
```

## 🛠️ Development Setup

### VS Code Setup (Recommended)
1. Install VS Code
2. Open the CoupleScript folder
3. The `.vscode/tasks.json` will be automatically configured
4. Press `Ctrl+Shift+P` → "Tasks: Run Task" → "Build CoupleScript"

### Editor Configuration
Create syntax highlighting by associating `.couple` files with CoupleScript:
```json
// In VS Code settings.json
{
    "files.associations": {
        "*.couple": "couplescript"
    }
}
```

## 🚨 Troubleshooting

### Common Issues & Solutions

#### "Command not found" or "File not found"
```bash
# Make sure the executable is in your PATH or use full path
chmod +x couplescript  # Linux/Mac: Make executable
.\couplescript.bat     # Windows: Use .bat extension
```

#### "Assembly errors" during build
```bash
# Install missing build tools
sudo apt-get install build-essential  # Ubuntu
brew install nasm                      # macOS
```

#### "Permission denied"
```bash
# Fix permissions (Linux/Mac)
chmod +x couplescript
chmod +x build.sh
```

#### Windows-specific issues
```powershell
# Enable script execution
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Use PowerShell instead of Command Prompt
powershell .\build.bat
```

### Getting Help
- 📖 Read `LANGUAGE_REFERENCE.md` for syntax help
- 💡 Check example files in `examples/` directory
- 🐛 Common error messages are relationship-themed for fun!

## 🌟 Quick Demo

Try this 30-second demo:

```bash
# 1. Clone the project
git clone <repo-url> && cd CoupleScript

# 2. Build (choose your platform)
.\build.bat          # Windows
make all            # Linux/Mac

# 3. Run the romantic calculator
./couplescript examples/calculator.couple

# 4. Try interactive mode
./couplescript
cs> marry love_level 100
cs> remember "My love is at " + love_level + "%!"
cs> exit
```

## 🎨 What Makes CoupleScript Special

- 💝 **No Dependencies**: Completely independent language
- 🎭 **Relationship Theme**: Every keyword is about love and marriage
- 🔧 **Self-Hosting**: The compiler is written in CoupleScript itself!
- 🚀 **Easy Setup**: Works out of the box on any system
- 📚 **Educational**: Learn programming through love stories
- 🎉 **Fun**: Programming should be enjoyable!

## 📱 Platform Support

| Platform | Status | Installation |
|----------|--------|-------------|
| Windows 10/11 | ✅ Full Support | Run `build.bat` |
| Ubuntu/Debian | ✅ Full Support | `apt-get install build-essential nasm && make all` |
| CentOS/RHEL | ✅ Full Support | `yum install gcc nasm && make all` |
| macOS | ✅ Full Support | `brew install nasm && make all` |
| Any Unix | ✅ Should Work | Install `nasm` + `gcc` then `make all` |

## 🎓 Learning Path

1. **Start Here**: Run `examples/hello.couple`
2. **Basic Concepts**: Try `examples/calculator.couple`
3. **Functions**: Explore `examples/functions.couple`
4. **Loops**: Understand `examples/loops.couple`
5. **Advanced**: Play with `examples/marriage_story.couple`
6. **Create**: Write your own love story in code!

## 💌 Next Steps

After installation:
1. 📖 Read the `LANGUAGE_REFERENCE.md`
2. 🎮 Run all example programs
3. 💝 Write your first CoupleScript love story
4. 🚀 Share your programs with others
5. 💕 Spread the love of romantic programming!

---

**Happy coding, and may your programs be as beautiful as your love story!** 💕✨

*Remember: In CoupleScript, every program is a love story waiting to be told!*
