# CoupleScript 💕
### The Programming Language for Lovers

[![Version](https://img.shields.io/badge/version-1.0.0-pink.svg)](https://github.com/rahul05ranjan/couple-script)
[![License](https://img.shields.io/badge/license-MIT-red.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20Linux%20%7C%20macOS-lightgrey.svg)](INSTALLATION.md)
[![Love](https://img.shields.io/badge/made_with-love-ff69b4.svg)](https://github.com/rahul05ranjan/couple-script)

Welcome to **CoupleScript** - the world's most romantic programming language! Express your code with the poetry of love, marriage, and relationships. From `marry`ing variables to `propose`ing functions, every line of code tells a love story.

## 🌟 Features

- **💕 Romantic Syntax**: Keywords inspired by marriage and relationships
- **🚀 Self-Hosting**: Written in CoupleScript itself with assembly bootstrap
- **🔧 Complete Independence**: No dependencies on Python, C, or JavaScript
- **💝 Fun & Educational**: Learn programming through love metaphors
- **🎯 Cross-Platform**: Works on Windows, Linux, and macOS
- **📚 Rich Examples**: 20+ romantic example programs included

## 🚀 Quick Start

### Simple Installation

**All Platforms:**
```bash
git clone https://github.com/rahul05ranjan/couple-script.git
cd couple-script
make all
```

### Write Your First Love Story

```couplescript
# hello_love.couple
marry greeting with "Hello, my love!"
remember greeting
```

Run it:
```bash
couplescript hello_love.couple
```

## 📥 Installation

### Windows
1. **One-Click Installer:**
   ```powershell
   iwr -useb https://raw.githubusercontent.com/rahul05ranjan/couple-script/main/install.bat | iex
   ```

2. **Manual Installation:**
   - Download the latest release
   - Run `build.bat` as Administrator
   - Add to PATH: `C:\CoupleScript\bin`

### Linux/macOS
1. **Quick Install:**
   ```bash
   curl -fsSL https://raw.githubusercontent.com/rahul05ranjan/couple-script/main/quick_install.sh | bash
   ```

2. **Manual Installation:**
   ```bash
   git clone https://github.com/rahul05ranjan/couple-script.git
   cd couple-script
   make all
   ```

### Verify Installation
```bash
couplescript --version
```

## 💖 Language Overview

CoupleScript uses relationship metaphors to make programming more intuitive and fun:

| CoupleScript | Traditional | Purpose |
|--------------|-------------|---------|
| `marry` | `=` | Variable assignment |
| `divorce` | `del` | Variable deletion |
| `propose` | `def` | Function definition |
| `accept` | Function call | Call a function |
| `argue` | `if` | Conditional statement |
| `makeup` | `else` | Else clause |
| `anniversary` | `while` | Loop construct |
| `remember` | `print` | Output/print |
| `promise` | `return` | Return statement |
| `love` | `true` | Boolean true |
| `hate` | `false` | Boolean false |
| `couple` | `[]` | Array/list |
| `memory` | `{}` | Object/dictionary |

## 📖 API Reference

### Variables & Data Types

```couplescript
# Numbers
marry age with 25
marry height with 5.9

# Strings
marry name with "Romeo"
marry message with "I love you"

# Booleans
marry is_married with love
marry is_single with hate

# Arrays (couples)
marry children with couple["Alice", "Bob", "Charlie"]

# Objects (memories)
marry person with memory{
    "name": "Juliet",
    "age": 23,
    "married": love
}
```

### Functions

```couplescript
# Function definition
propose calculate_love(person1, person2) {
    marry compatibility with (person1.age + person2.age) % 100
    promise compatibility
}

# Function call
marry love_score with accept calculate_love(romeo, juliet)
```

### Control Flow

```couplescript
# Conditionals
argue love_score > 80 {
    remember "Perfect match!"
} makeup argue love_score > 60 {
    remember "Good compatibility"
} makeup {
    remember "Keep working on it!"
}

# Loops
marry counter with 0
anniversary counter < 10 {
    remember "Day " + counter + " of our love"
    marry counter with counter + 1
}
```

### Standard Library

#### I/O Operations
- `remember(message)` - Print to console
- `whisper(prompt)` - Get user input
- `write_love_letter(filename, content)` - Write to file
- `read_love_letter(filename)` - Read from file

#### String Operations
- `concat(str1, str2)` - Concatenate strings
- `length(string)` - Get string length
- `uppercase(string)` - Convert to uppercase
- `lowercase(string)` - Convert to lowercase

#### Math Operations
- `add(a, b)` - Addition
- `subtract(a, b)` - Subtraction
- `multiply(a, b)` - Multiplication
- `divide(a, b)` - Division
- `random()` - Generate random number

#### Date/Time
- `today()` - Get current date
- `anniversary_date(year, month, day)` - Create date
- `days_together(date1, date2)` - Calculate difference

## 🎨 Fun Examples

### 1. Love Calculator
```couplescript
propose calculate_love_percentage(name1, name2) {
    marry total with 0
    marry i with 0
    anniversary i < length(name1) {
        marry total with total + char_code(name1[i])
        marry i with i + 1
    }
    marry i with 0
    anniversary i < length(name2) {
        marry total with total + char_code(name2[i])
        marry i with i + 1
    }
    promise (total % 100) + 1
}

marry percentage with accept calculate_love_percentage("Romeo", "Juliet")
remember "Love compatibility: " + percentage + "%"
```

### 2. Wedding Planner
```couplescript
marry wedding_tasks with couple[
    "Book venue",
    "Choose flowers",
    "Send invitations",
    "Order cake",
    "Pick music"
]

marry completed with couple[]

propose complete_task(task) {
    remember "✓ Completed: " + task
    marry completed with completed + couple[task]
}

marry i with 0
anniversary i < length(wedding_tasks) {
    marry task with wedding_tasks[i]
    remember "□ " + task
    marry i with i + 1
}
```

### 3. Anniversary Countdown
```couplescript
propose days_until_anniversary(anniversary_date) {
    marry today_date with today()
    marry difference with anniversary_date - today_date
    promise difference
}

marry our_anniversary with anniversary_date(2024, 6, 15)
marry days_left with accept days_until_anniversary(our_anniversary)

argue days_left > 0 {
    remember days_left + " days until our anniversary!"
} makeup argue days_left == 0 {
    remember "Happy Anniversary! 💕"
} makeup {
    remember "Our anniversary was " + (0 - days_left) + " days ago!"
}
```

### 4. Relationship Status Tracker
```couplescript
marry relationship_status with memory{
    "status": "dating",
    "since": anniversary_date(2023, 2, 14),
    "milestones": couple[]
}

propose add_milestone(milestone) {
    marry new_milestone with memory{
        "event": milestone,
        "date": today()
    }
    marry relationship_status.milestones with 
        relationship_status.milestones + couple[new_milestone]
    remember "Added milestone: " + milestone
}

accept add_milestone("First kiss")
accept add_milestone("Met the parents")
accept add_milestone("Moved in together")
```

### 5. Love Letter Generator
```couplescript
marry romantic_words with couple[
    "beautiful", "amazing", "wonderful", "perfect",
    "gorgeous", "lovely", "stunning", "incredible"
]

marry love_phrases with couple[
    "You are my everything",
    "I can't imagine life without you",
    "You make every day brighter",
    "My heart belongs to you"
]

propose generate_love_letter(recipient_name) {
    marry letter with "My dearest " + recipient_name + ",\n\n"
    
    marry word_index with random() % length(romantic_words)
    marry phrase_index with random() % length(love_phrases)
    
    marry letter with letter + "You are absolutely " + 
        romantic_words[word_index] + ". "
    marry letter with letter + love_phrases[phrase_index] + ".\n\n"
    marry letter with letter + "Forever yours,\nYour Secret Admirer"
    
    promise letter
}

marry love_letter with accept generate_love_letter("Juliet")
remember love_letter
```

## 🎮 More Examples

Explore our collection of 20+ fun examples:

1. **Love Calculator** - Calculate compatibility between two people
2. **Date Planner** - Plan perfect romantic dates
3. **Wedding Planner** - Organize wedding tasks and timeline
4. **Anniversary Countdown** - Track special dates
5. **Relationship Milestones** - Record important moments
6. **Love Letter Generator** - Create personalized love letters
7. **Couple's Quiz** - Fun relationship trivia game
8. **Gift Reminder** - Never forget important gift-giving occasions
9. **Date Night Picker** - Random date idea generator
10. **Love Song Playlist** - Curate romantic music collections
11. **Proposal Planner** - Plan the perfect proposal
12. **Couple's Budget** - Manage finances together
13. **Travel Planner** - Plan romantic getaways
14. **Memory Book** - Digital scrapbook for couples
15. **Relationship Goals** - Set and track couple goals
16. **Love Horoscope** - Generate romantic predictions
17. **Couple's Game Night** - Interactive games for two
18. **Recipe for Love** - Romantic cooking suggestions
19. **Love Poem Generator** - Create custom poetry
20. **Relationship Analyzer** - Analyze relationship patterns

[View All Examples →](examples/)

## 🛠️ Development

### Building from Source

```bash
git clone https://github.com/rahul05ranjan/couple-script.git
cd couple-script
make all

# Linux/macOS
make
```

### Running Tests

```bash
make test
```

### Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

## 📚 Documentation

- [Getting Started Guide](GETTING_STARTED.md)
- [Language Reference](LANGUAGE_REFERENCE.md)
- [Installation Guide](INSTALLATION.md)
- [API Documentation](api/)
- [Examples](examples/)

## 🤝 Community

- **GitHub Issues**: [Report bugs or request features](https://github.com/rahul05ranjan/couple-script/issues)
- **Discussions**: [Join the community](https://github.com/rahul05ranjan/couple-script/discussions)
- **Discord**: [CoupleScript Community Server](https://discord.gg/couplescript)
- **Twitter**: [@CoupleScript](https://twitter.com/couplescript)

## 📝 License

CoupleScript is released under the [MIT License](LICENSE).

## 💝 Credits

Created with love by the CoupleScript community. Special thanks to all contributors who helped make programming more romantic!

---

**"In code as in love, every statement should be meaningful." - CoupleScript Philosophy**

[⭐ Star us on GitHub](https://github.com/rahul05ranjan/couple-script) | [📥 Download Latest Release](https://github.com/rahul05ranjan/couple-script/releases)
