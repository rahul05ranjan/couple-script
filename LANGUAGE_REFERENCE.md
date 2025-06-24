# CoupleScript Language Reference Guide 💕

## Introduction
CoupleScript is a fun, relationship-themed programming language that uses marriage and relationship metaphors to make programming more enjoyable and relatable. This language is completely independent and doesn't depend on any other programming language!

## Keywords Reference

### Variable Operations
- `marry variable_name value` - Declares and assigns a variable (like saying "I do!")
- `divorce variable_name` - Deletes a variable (hopefully rarely used! 😄)

### Control Flow
- `argue condition:` - If statement (when couples need to discuss things)
- `makeup:` - Else clause (making up after an argument)
- `anniversary variable in collection:` - For loop (celebrating each iteration)
- `separate` - Break statement (taking a break from the loop)
- `together` - Block grouping (staying united)

### Functions
- `propose function_name(parameters):` - Function definition (proposing a new idea)
- `accept function_name(arguments)` - Function call (accepting the proposal)
- `promise value` - Return statement (keeping your promises)

### Input/Output
- `remember expression` - Print/output (remembering important moments)
- `forget` - Clear/reset (letting go of the past)

### Data Types
- `love` - Boolean true (obviously! 💖)
- `hate` - Boolean false (hopefully rare in relationships)
- `heart` - Number type (matters of the heart)
- `words` - String type (sweet words between lovers)
- `couple` - Array/List (a pair or group, like [1, 2, 3])
- `memory` - Object/Dictionary (shared memories, like {"key": "value"})

### Operators
- `+` - Addition / String concatenation
- `-` - Subtraction
- `*` - Multiplication
- `/` - Division
- `==` - Equality (perfect match!)
- `!=` - Not equal (differences are okay!)
- `<` - Less than
- `>` - Greater than
- `<=` - Less than or equal
- `>=` - Greater than or equal
- `and` - Logical AND (both agree)
- `or` - Logical OR (either one agrees)
- `not` - Logical NOT (disagreement)

## Example Programs

### Hello World
```couplescript
marry message "Hello, World!"
remember message
```

### Variables and Conditions
```couplescript
marry husband_age 28
marry wife_age 26

argue husband_age > wife_age:
    remember "Husband is older"
makeup:
    remember "Wife is older or same age"
```

### Functions
```couplescript
propose greet(name):
    remember "Hello, " + name + "!"
    promise "Greeting complete"

marry result accept greet("Alice")
remember result
```

### Loops
```couplescript
marry years couple[1, 2, 3, 4, 5]

anniversary year in years:
    remember "Year " + year + " of marriage"
    argue year == 5:
        remember "Five year anniversary!"
        separate
```

### Arrays and Objects
```couplescript
marry couple_names couple["John", "Jane"]
marry relationship_info memory{
    "years_together": 3,
    "children": 1,
    "happiness_level": 95
}

remember "Couple: " + couple_names[0] + " and " + couple_names[1]
remember "Happiness: " + relationship_info["happiness_level"] + "%"
```

## Language Philosophy

CoupleScript is designed around the beautiful metaphor of marriage and relationships:

1. **Marriage (`marry`)** - Starting a new relationship with a variable
2. **Proposals (`propose`)** - Suggesting new functions and ideas
3. **Acceptance (`accept`)** - Agreeing to use those functions
4. **Arguments (`argue`)** - Discussing conditions (but with logic!)
5. **Making up (`makeup`)** - Resolving differences (else clauses)
6. **Anniversaries (`anniversary`)** - Celebrating repeated actions (loops)
7. **Promises (`promise`)** - Keeping commitments (return values)
8. **Memories (`memory`)** - Storing shared experiences (objects)
9. **Love and Hate** - The fundamental truths (true/false)

## Best Practices

1. **Name variables meaningfully** - Use romantic, descriptive names
2. **Comment your love story** - Use # for comments
3. **Handle arguments gracefully** - Always include `makeup` clauses
4. **Keep promises** - Ensure functions return values when expected
5. **Celebrate milestones** - Use `anniversary` loops for iterations
6. **Remember important moments** - Use `remember` for output

## File Extensions
- Use `.couple` for CoupleScript files (Romantic and unique!)

## Running CoupleScript

### Interactive Mode
```bash
./couplescript
cs> marry name "Love"
cs> remember "Hello, " + name + "!"
cs> exit
```

### Running Files
```bash
./couplescript my_program.couple
```

## Error Messages
CoupleScript uses relationship-themed error messages:
- "Syntax Error: This relationship isn't working out..."
- "Runtime Error: Broken promise - function didn't return a value"
- "Type Error: These two don't seem compatible..."

## Contributing
We welcome contributions to make CoupleScript even more romantic and fun! Remember, this is a language about love, so keep contributions positive and family-friendly.

---

*"In CoupleScript, every program is a love story waiting to be told!"* 💕

## Technical Implementation Note
CoupleScript is implemented completely independently with:
- Assembly language bootstrap compiler
- Custom virtual machine
- Self-hosting compiler written in CoupleScript itself
- No dependencies on Python, C, JavaScript, or any other language!

This makes it a truly independent programming language that stands on its own! 🎉
