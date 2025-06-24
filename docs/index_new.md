---
layout: default
title: "CoupleScript - The Programming Language for Lovers"
description: "Express your code with the poetry of love, marriage, and relationships"
---

<style>
:root {
    --primary-pink: #ff69b4;
    --secondary-pink: #ffb6c1;
    --accent-red: #ff1744;
    --warm-white: #fef7f7;
    --text-dark: #2d3748;
    --gradient-romantic: linear-gradient(135deg, #ff69b4 0%, #ff1744 100%);
    --shadow-soft: 0 4px 20px rgba(255, 105, 180, 0.1);
}

.hero-section {
    background: var(--gradient-romantic);
    color: white;
    padding: 4rem 2rem;
    text-align: center;
    border-radius: 15px;
    margin-bottom: 3rem;
}

.hero-title {
    font-size: 3rem;
    font-weight: bold;
    margin-bottom: 1rem;
}

.hero-subtitle {
    font-size: 1.25rem;
    margin-bottom: 2rem;
    opacity: 0.9;
}

.cta-buttons {
    display: flex;
    gap: 1rem;
    justify-content: center;
    flex-wrap: wrap;
}

.btn {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.75rem 2rem;
    border-radius: 50px;
    text-decoration: none;
    font-weight: 600;
    transition: all 0.3s ease;
    border: 2px solid transparent;
}

.btn-primary {
    background: white;
    color: var(--primary-pink);
}

.btn-secondary {
    background: transparent;
    color: white;
    border-color: white;
}

.features-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 2rem;
    margin: 3rem 0;
}

.feature-card {
    background: var(--warm-white);
    padding: 2rem;
    border-radius: 15px;
    box-shadow: var(--shadow-soft);
    text-align: center;
    border-left: 4px solid var(--primary-pink);
}

.feature-icon {
    font-size: 3rem;
    margin-bottom: 1rem;
}

.code-example {
    background: #2d3748;
    color: #e2e8f0;
    padding: 2rem;
    border-radius: 15px;
    margin: 2rem 0;
    overflow-x: auto;
}

.keyword { color: #ff69b4; font-weight: bold; }
.string { color: #a78bfa; }
.comment { color: #64748b; font-style: italic; }

@media (max-width: 768px) {
    .hero-title { font-size: 2rem; }
    .cta-buttons { flex-direction: column; align-items: center; }
}
</style>

<div class="hero-section">
    <h1 class="hero-title">💕 CoupleScript</h1>
    <p class="hero-subtitle">The world's most romantic programming language - where every program is a love story!</p>
    <div class="cta-buttons">
        <a href="https://github.com/rahul05ranjan/couple-script" class="btn btn-primary">
            💖 Start Coding Love
        </a>
        <a href="installation.html" class="btn btn-secondary">
            📖 Installation Guide
        </a>
    </div>
</div>

## 🌟 What is CoupleScript?

CoupleScript is a fun, relationship-themed programming language that uses marriage and love metaphors to make programming more enjoyable and relatable. **Built completely from scratch with no dependencies on existing languages!**

<div class="code-example">
<code>
<span class="comment"># Your first love story in code! 💕</span>
<span class="keyword">marry</span> husband <span class="string">"Alex"</span>
<span class="keyword">marry</span> wife <span class="string">"Emma"</span>

<span class="keyword">remember</span> <span class="string">"Meet our lovely couple: "</span> + husband + <span class="string">" and "</span> + wife

<span class="keyword">argue</span> love:
    <span class="keyword">remember</span> <span class="string">"They lived happily ever after! 🎉"</span>
    <span class="keyword">anniversary</span> year <span class="keyword">in</span> couple[1, 2, 3, 4, 5]:
        <span class="keyword">remember</span> <span class="string">"Year "</span> + year + <span class="string">": Still in love! 💖"</span>
<span class="keyword">makeup</span>:
    <span class="keyword">remember</span> <span class="string">"Every relationship has its challenges... 💪"</span>
</code>
</div>

## 💝 Features

<div class="features-grid">
    <div class="feature-card">
        <div class="feature-icon">💝</div>
        <h3>Completely Independent</h3>
        <p>No Python, C, or JavaScript dependencies. Built from scratch with pure assembly language.</p>
    </div>
    
    <div class="feature-card">
        <div class="feature-icon">🎭</div>
        <h3>Romantic Keywords</h3>
        <p><code>marry</code>, <code>propose</code>, <code>accept</code>, <code>argue</code>, <code>makeup</code>, <code>remember</code> - programming with love!</p>
    </div>
    
    <div class="feature-card">
        <div class="feature-icon">🔧</div>
        <h3>Self-Hosting</h3>
        <p>The compiler is written in CoupleScript itself! A true testament to the language's power.</p>
    </div>
    
    <div class="feature-card">
        <div class="feature-icon">⚡</div>
        <h3>Lightning Fast</h3>
        <p>Assembly-based virtual machine ensures your love stories run at the speed of light.</p>
    </div>
    
    <div class="feature-card">
        <div class="feature-icon">🌍</div>
        <h3>Cross-Platform</h3>
        <p>Works on Windows, Linux, and macOS. Love knows no boundaries!</p>
    </div>
      <div class="feature-card">
        <div class="feature-icon">🧪</div>
        <h3>Comprehensive Testing</h3>
        <p>Production-grade test suite with CI/CD pipeline ensures reliability and quality.</p>
    </div>
    
    <div class="feature-card">
        <div class="feature-icon">📚</div>
        <h3>Educational & Fun</h3>
        <p>Learn programming through romantic metaphors that make concepts memorable and enjoyable.</p>
    </div>
</div>

## 🚀 Quick Start

### 1. Install Prerequisites

**Windows:**
- Install [NASM](https://www.nasm.us/pub/nasm/releasebuilds/) assembler
- Install Visual Studio Build Tools or use WSL

**Linux/macOS:**
```bash
# Ubuntu/Debian
sudo apt install build-essential nasm

# macOS
xcode-select --install
```

### 2. Build & Run

```bash
# Clone and build
git clone https://github.com/rahul05ranjan/couple-script.git
cd couple-script
make all

# Run your first love story
# Windows: couplescript.bat examples/hello.couple
# Linux/macOS: ./couplescript examples/hello.couple
```

## 💕 Language Syntax

### Keywords & Concepts
- `marry` - Variable declaration/assignment
- `divorce` - Variable deletion  
- `propose` - Function definition
- `accept` - Function call
- `argue` - Conditional statements (if)
- `makeup` - Else clause
- `remember` - Print/output
- `anniversary` - Loop construct
- `love`/`hate` - Boolean true/false
- `couple` - Arrays/Lists
- `memory` - Objects/Dictionaries

### Example Programs

**Hello World:**
```couplescript
marry message "Hello, World! 💕"
remember message
```

**Functions:**
```couplescript
propose greet(name):
    remember "Hello, " + name + "!"

accept greet("Alice")
```

**Loops:**
```couplescript
marry favorites couple["Pizza", "Movies", "Travel"]

anniversary item in favorites:
    remember "💝 " + item
```

## 📖 Resources

- **[Installation Guide](installation.html)** - Complete setup instructions
- **[Examples](examples.html)** - Learn from romantic code examples  
- **[API Reference](api.html)** - Complete language documentation
- **[GitHub Repository](https://github.com/rahul05ranjan/couple-script)** - Source code and contributions

## 🤝 Community

Join our community of romantic programmers! Whether you're a seasoned developer or just starting your coding journey, there are many ways to contribute:

- 🐛 [Report bugs or request features](https://github.com/rahul05ranjan/couple-script/issues)
- 💻 [Contribute code](https://github.com/rahul05ranjan/couple-script/blob/main/CONTRIBUTING.md)
- 📚 Write tutorials or improve documentation
- 💕 Share your CoupleScript love stories!

## 🎉 Get Started Today

Ready to write your first love story in code? 

<div class="cta-buttons" style="margin: 2rem 0;">
    <a href="https://github.com/rahul05ranjan/couple-script" class="btn btn-primary">
        💖 Download CoupleScript
    </a>
    <a href="examples.html" class="btn btn-secondary">
        👀 See Examples
    </a>
</div>

---

*Remember: In CoupleScript, every program is a love story waiting to be told!* 💕✨
