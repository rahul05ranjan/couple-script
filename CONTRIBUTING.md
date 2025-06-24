# 💕 Contributing to CoupleScript

Thank you for your interest in contributing to CoupleScript! We're excited to have you join our romantic coding community. Every contribution, no matter how small, helps make programming more lovely for everyone! 💖

## 🌟 How to Contribute

### 🚀 Quick Start

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/couple-script.git
   cd couple-script
   ```
3. **Set up upstream remote**:
   ```bash
   git remote add upstream https://github.com/rahul05ranjan/couple-script.git
   ```
4. **Build and test**:
   ```bash
   make all
   make test
   ```

### 🎯 Types of Contributions

#### 🐛 Bug Reports
- Use our [issue templates](https://github.com/rahul05ranjan/couple-script/issues/new/choose)
- Include steps to reproduce
- Provide system information
- Add relevant error messages

#### ✨ Feature Requests
- Describe the romantic scenario your feature would enable
- Explain why this would make CoupleScript more lovely
- Provide examples of how it would be used
- Consider how it fits with the relationship theme

#### 💻 Code Contributions
- New language features
- Bug fixes
- Performance improvements
- Documentation updates
- Example programs

#### 📚 Documentation
- API documentation
- Tutorials and guides
- Example programs
- Translation to other languages

## 🔧 Development Setup

### Prerequisites
```bash
# Linux/Ubuntu
sudo apt-get install build-essential nasm

# macOS
brew install nasm

# Windows
# Install NASM from https://www.nasm.us/
# Or use WSL with Linux instructions
```

### Building CoupleScript
```bash
# Clean build
make clean
make all

# Run tests
make test

# Create examples
make examples

# Test interactive mode
./couplescript
```

## 📝 Coding Guidelines

### Romantic Naming Conventions
- **Variables**: `camelCase` with romantic names
  ```couplescript
  marry myTrueLove "Alice"
  marry anniversaryDate "2024-02-14"
  ```

- **Functions**: Use relationship metaphors
  ```couplescript
  propose plan_romantic_dinner(cuisine, budget)
  propose calculate_love_compatibility(person1, person2)
  propose send_love_letter(recipient, message)
  ```

- **Constants**: `UPPER_CASE` with eternal themes
  ```couplescript
  marry ETERNAL_LOVE love
  marry MAX_ROMANCE_LEVEL 100
  marry INFINITY_SYMBOL "∞"
  ```

### Code Style
- Use 4 spaces for indentation
- Add romantic comments that tell a story
- Keep functions focused (like a perfect date plan)
- Test your code thoroughly (stable relationships!)

### Example of Good Code
```couplescript
# Calculate compatibility between two lovely people
propose calculate_compatibility(person1, person2):
    # Every relationship starts with a spark! ✨
    marry compatibility_score 0
    
    # Check shared interests (the foundation of love)
    marry shared_interests accept count_common_interests(person1, person2)
    compatibility_score = compatibility_score + (shared_interests * 10)
    
    # Communication is key! 💬
    marry communication_style accept analyze_communication(person1, person2)
    argue communication_style == "compatible":
        compatibility_score = compatibility_score + 30
    
    # Love always finds a way! 💕
    argue compatibility_score > 70:
        promise "Perfect Match! 💖"
    makeup:
        promise "Good Potential! 😊"
```

## 🌈 Feature Ideas

### 🆕 Beginner Friendly
- [ ] Add `compliment()` function for positive affirmations
- [ ] Create `date_ideas` data structure with romantic suggestions
- [ ] Implement `love_letter_generator()` function
- [ ] Add more romantic example programs
- [ ] Improve error messages to be more encouraging

### 🔧 Intermediate
- [ ] Add `engagement` keyword for constants (immutable like commitment!)
- [ ] Implement `anniversary_reminder` system
- [ ] Create `relationship_status` enum type
- [ ] Add file I/O for saving love stories
- [ ] Implement `couple_quiz` interactive function

### 🚀 Advanced
- [ ] Add networking for "long-distance relationships"
- [ ] Implement concurrent "relationships" (threading)
- [ ] Create a package manager for romantic libraries
- [ ] Add compilation to native machine code
- [ ] Implement a graphical "love story" debugger

## 🧪 Testing

### Running Tests
```bash
# Run all tests
make test

# Test specific functionality
./couplescript examples/test_suite.couple

# Interactive testing
./couplescript
cs> marry test_var "Hello, Love!"
cs> remember test_var
```

### Adding Tests
- Add test cases to `examples/tests/`
- Follow the naming pattern: `test_feature_name.couple`
- Include both positive and negative test cases
- Document expected behavior

## 📋 Pull Request Process

### Before Submitting
1. **Update documentation** if you changed functionality
2. **Add tests** for new features
3. **Update examples** if relevant
4. **Test thoroughly** on your local machine
5. **Write romantic commit messages**

### Commit Message Style
```bash
# Good examples:
git commit -m "Add 'first_kiss' function to mark special moments 💋"
git commit -m "Fix heartbreak in loop termination logic 💔➡️💖"
git commit -m "Improve 'propose' keyword error messages to be more encouraging"

# Less good:
git commit -m "Fix bug"
git commit -m "Update function"
```

### Pull Request Template
When creating a PR, please include:

```markdown
## 💕 What this PR does
Brief description of your changes and why they make CoupleScript more lovely

## 🧪 How to test
Steps to test your changes

## 📋 Checklist
- [ ] Code follows the romantic naming conventions
- [ ] Tests added/updated
- [ ] Documentation updated
- [ ] Examples added/updated if relevant
- [ ] Commit messages are loving and descriptive

## 💖 Additional notes
Any other context about your romantic contribution
```

## 🏆 Recognition

Contributors will be featured in:
- 📜 **Hall of Love** (CONTRIBUTORS.md)
- 🎉 **Release notes** with special thanks
- 💫 **Romantic titles** based on contribution type:
  - 💝 **Love Letter Writer** - Documentation contributors
  - 🏗️ **Relationship Architect** - Core system contributors  
  - 🎨 **Romance Designer** - UI/UX contributors
  - 🧪 **Love Scientist** - Testing contributors
  - 🌟 **Cupid's Helper** - Community supporters

## 🤝 Community Guidelines

### Our Love Code of Conduct
- **Be kind and respectful** - Like in any good relationship
- **Help others learn** - Love grows when shared
- **Embrace diversity** - Love comes in all forms
- **Stay constructive** - Build each other up
- **Keep it romantic** - But professional too! 😊

### Getting Help
- 💬 **GitHub Discussions**: Ask questions and share ideas
- 🐛 **Issues**: Report bugs or request features  
- 📧 **Direct contact**: For sensitive matters
- 📚 **Documentation**: Check our guides first

## 🎉 Your First Contribution

Never contributed to open source? No problem! Here are some beginner-friendly ways to start:

1. **Fix a typo** in documentation
2. **Add a romantic example** program
3. **Improve an error message** to be more encouraging
4. **Write a tutorial** about a CoupleScript feature
5. **Suggest a new feature** with a detailed proposal

## 🚀 Advanced Contributing

### Setting up Development Environment

```bash
# Fork and clone
git clone https://github.com/YOUR_USERNAME/couple-script.git
cd couple-script

# Set up development branches
git checkout -b develop
git push origin develop

# Create feature branch
git checkout -b feature/your-romantic-feature

# Install development tools (optional)
# Add any linters, formatters, or debugging tools you prefer
```

### Project Structure
```
couple-script/
├── bootstrap/          # Assembly bootstrap compiler
│   ├── compiler.s     # Bootstrap compiler in assembly
│   └── vm.s          # Virtual machine in assembly
├── examples/          # Example CoupleScript programs
│   ├── basic/        # Basic examples
│   └── fun/          # Fun romantic programs
├── docs/             # Documentation website
├── couplescript-compiler.couple  # Self-hosting compiler
├── Makefile          # Build system
└── README.md         # Project overview
```

---

## 💝 Thank You!

Every contribution makes CoupleScript more lovely and helps spread the joy of romantic programming. Whether you're fixing a small bug or adding a major feature, you're helping create something beautiful that brings joy to developers around the world.

**Ready to contribute? We can't wait to see what romantic magic you'll bring to CoupleScript!** 💖

---

*"In code as in love, every contribution matters!"* 💕
