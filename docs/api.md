# 📚 CoupleScript API Reference

Complete documentation for the CoupleScript programming language, including all keywords, functions, and standard library.

## 🏗️ Language Structure

### Comments
```couplescript
# This is a single-line comment
# Use comments to tell your love story!
```

### Variables

#### Declaration and Assignment
```couplescript
# Basic variable assignment
marry name with "Romeo"
marry age with 25
marry is_happy with love

# Update existing variable
marry name with "Romeo Montague"
```

#### Variable Deletion
```couplescript
# Delete a variable
divorce old_variable
```

## 📊 Data Types

### Primitive Types

#### Strings
```couplescript
marry message with "Hello, my love!"
marry multiline with "First line\nSecond line"
marry quoted with "She said \"I love you\""
```

#### Numbers
```couplescript
marry integer with 42
marry float with 3.14159
marry negative with -100
```

#### Booleans
```couplescript
marry is_married with love    # true
marry is_single with hate     # false
```

### Composite Types

#### Arrays (couple)
```couplescript
# Create an array
marry names with couple["Alice", "Bob", "Charlie"]
marry numbers with couple[1, 2, 3, 4, 5]
marry mixed with couple["text", 42, love]

# Access elements
marry first_name with names[0]
marry last_number with numbers[4]

# Modify elements
marry names[0] with "Alicia"

# Array operations
marry combined with names + couple["David"]
marry length with length(names)
```

#### Objects (memory)
```couplescript
# Create an object
marry person with memory{
    "name": "Juliet",
    "age": 21,
    "city": "Verona"
}

# Access properties
marry person_name with person.name
marry person_age with person["age"]

# Modify properties
marry person.age with 22
marry person["city"] with "Venice"

# Add new properties
marry person.married with love
```

## 🔧 Control Flow

### Conditionals

#### Basic If Statement
```couplescript
argue age >= 18 {
    remember "You're an adult!"
}
```

#### If-Else
```couplescript
argue weather == "sunny" {
    remember "Perfect day for a picnic!"
} makeup {
    remember "Let's stay cozy inside!"
}
```

#### If-Else If-Else
```couplescript
argue score >= 90 {
    remember "Excellent!"
} makeup argue score >= 80 {
    remember "Very good!"
} makeup argue score >= 70 {
    remember "Good job!"
} makeup {
    remember "Keep trying!"
}
```

### Loops

#### While Loop (anniversary)
```couplescript
marry counter with 0
anniversary counter < 5 {
    remember "Count: " + counter
    marry counter with counter + 1
}
```

#### For-Each Loop
```couplescript
marry colors with couple["red", "pink", "purple"]
anniversary color in colors {
    remember "I love " + color + " flowers!"
}
```

#### For Loop with Index
```couplescript
marry items with couple["roses", "chocolates", "letters"]
marry i with 0
anniversary i < length(items) {
    remember (i + 1) + ". " + items[i]
    marry i with i + 1
}
```

## 🎯 Functions

### Function Definition
```couplescript
# Simple function
propose greet() {
    remember "Hello, lovebirds!"
}

# Function with parameters
propose greet_person(name, title) {
    remember "Hello, " + title + " " + name + "!"
}

# Function with return value
propose calculate_love_score(compatibility) {
    marry score with compatibility * 100
    promise score
}
```

### Function Calls
```couplescript
# Call simple function
accept greet()

# Call with parameters
accept greet_person("Romeo", "Mr.")

# Call with return value
marry our_score with accept calculate_love_score(0.95)
```

### Advanced Function Features
```couplescript
# Function with multiple return values
propose get_name_parts(full_name) {
    marry parts with split(full_name, " ")
    promise parts[0], parts[1]  # first name, last name
}

# Use multiple return values
marry first, last with accept get_name_parts("Romeo Montague")
```

## 📥 Input/Output

### Output Functions
```couplescript
# Print to console
remember "Hello, world!"
remember "Your love score: " + score + "%"

# Print without newline
whisper_softly "Loading..."  # No newline at end
```

### Input Functions
```couplescript
# Get user input
marry name with whisper("What's your name? ")
marry age with whisper_number("How old are you? ")
marry confirmed with whisper_boolean("Do you love them? (love/hate): ")
```

## 🧮 Built-in Functions

### String Functions
```couplescript
# String length
marry length with length("Hello")  # Returns 5

# String concatenation
marry greeting with concat("Hello", " ", "World")

# String conversion
marry text with to_string(42)
marry number with to_number("123")

# Case conversion
marry upper with uppercase("hello")      # "HELLO"
marry lower with lowercase("WORLD")      # "world"

# String searching
marry position with find("Hello World", "World")  # Returns 6
marry contains with contains("Hello", "ell")      # Returns love (true)

# String splitting and joining
marry parts with split("apple,banana,cherry", ",")
marry joined with join(parts, " | ")
```

### Math Functions
```couplescript
# Basic math
marry sum with add(5, 3)           # 8
marry difference with subtract(10, 4)  # 6
marry product with multiply(6, 7)      # 42
marry quotient with divide(15, 3)      # 5
marry remainder with modulo(17, 5)     # 2

# Advanced math
marry power with power(2, 8)           # 256
marry root with sqrt(16)               # 4
marry absolute with abs(-5)            # 5

# Rounding
marry rounded with round(3.7)          # 4
marry floored with floor(3.9)          # 3
marry ceiling with ceil(3.1)           # 4

# Random numbers
marry random_float with random()              # 0.0 to 1.0
marry random_int with random_range(1, 10)     # 1 to 10
```

### Array Functions
```couplescript
marry fruits with couple["apple", "banana", "cherry"]

# Array length
marry count with length(fruits)         # 3

# Add elements
marry fruits with fruits + couple["date"]     # Add to end
marry fruits with couple["apricot"] + fruits  # Add to beginning

# Remove elements
marry fruits with remove(fruits, "banana")    # Remove by value
marry fruits with remove_at(fruits, 0)       # Remove by index

# Search in array
marry position with find(fruits, "cherry")   # Find index
marry exists with contains(fruits, "apple")  # Check existence

# Array manipulation
marry sorted with sort(fruits)               # Sort alphabetically
marry reversed with reverse(fruits)          # Reverse order
marry sliced with slice(fruits, 1, 3)       # Get subset
```

### Date and Time Functions
```couplescript
# Current date and time
marry now with today()
marry current_time with now()

# Create specific dates
marry anniversary with anniversary_date(2023, 6, 15)  # Year, month, day
marry wedding_time with datetime(2023, 6, 15, 14, 30)  # Year, month, day, hour, minute

# Date calculations
marry days_apart with days_between(date1, date2)
marry future_date with add_days(anniversary, 365)
marry past_date with subtract_days(today(), 30)

# Date formatting
marry formatted with format_date(anniversary, "YYYY-MM-DD")
marry readable with format_date(anniversary, "Month DD, YYYY")
```

### File I/O Functions
```couplescript
# Write to file
accept write_love_letter("my_story.txt", "Our beautiful love story...")

# Read from file
marry story with accept read_love_letter("my_story.txt")

# Check if file exists
marry file_exists with file_exists("diary.txt")

# Append to file
accept append_to_letter("diary.txt", "Today was amazing...")
```

## 🔄 Error Handling

### Try-Catch Equivalent
```couplescript
# Handle potential errors
attempt {
    marry result with divide(10, 0)
    remember "Result: " + result
} handle error {
    remember "Oops! Can't divide by zero!"
    remember "Error: " + error.message
}
```

### Validation Functions
```couplescript
# Type checking
marry is_text with is_string(value)
marry is_num with is_number(value)
marry is_bool with is_boolean(value)
marry is_list with is_array(value)
marry is_obj with is_object(value)

# Value validation
argue is_valid_email(email) {
    remember "Valid email address!"
} makeup {
    remember "Please enter a valid email!"
}
```

## 🎨 Advanced Features

### Object-Oriented Programming
```couplescript
# Define a class-like structure
propose create_person(name, age) {
    marry person with memory{
        "name": name,
        "age": age,
        "greet": propose() {
            remember "Hello, I'm " + person.name
        },
        "celebrate_birthday": propose() {
            marry person.age with person.age + 1
            remember person.name + " is now " + person.age + " years old!"
        }
    }
    promise person
}

# Use the "class"
marry romeo with accept create_person("Romeo", 18)
accept romeo.greet()
accept romeo.celebrate_birthday()
```

### Lambda Functions
```couplescript
# Simple lambda
marry double with lambda(x) { promise x * 2 }
marry result with accept double(5)  # Returns 10

# Lambda with array operations
marry numbers with couple[1, 2, 3, 4, 5]
marry doubled with map(numbers, lambda(x) { promise x * 2 })
marry evens with filter(numbers, lambda(x) { promise x % 2 == 0 })
```

### Modules and Imports
```couplescript
# Import other CoupleScript files
import "love_utils.couple"
import "date_helpers.couple" as dates

# Use imported functions
marry compatibility with accept calculate_compatibility("Romeo", "Juliet")
marry next_anniversary with accept dates.next_anniversary(2023, 6, 15)
```

## 🌟 Standard Library Modules

### Love Utilities (`love_utils.couple`)
```couplescript
import "std/love_utils.couple"

# Relationship functions
marry compatibility with accept calculate_compatibility(person1, person2)
marry love_score with accept love_percentage(relationship_months)
marry date_idea with accept random_date_idea("romantic")
```

### Date Helpers (`date_utils.couple`)
```couplescript
import "std/date_utils.couple"

# Date manipulation
marry next_holiday with accept next_valentine()
marry anniversary_countdown with accept days_until(anniversary_date)
marry relationship_milestones with accept calculate_milestones(start_date)
```

### Text Generators (`text_gen.couple`)
```couplescript
import "std/text_gen.couple"

# Text generation
marry love_letter with accept generate_love_letter(partner_name)
marry poem with accept generate_poem("romantic")
marry compliment with accept random_compliment()
```

## 📝 Code Style Guidelines

### Naming Conventions
```couplescript
# Variables: lowercase with underscores
marry user_name with "Romeo"
marry love_score with 95

# Functions: descriptive action words
propose calculate_compatibility() { ... }
propose send_love_message() { ... }

# Constants: uppercase with underscores
marry MAX_LOVE_LEVEL with 100
marry DEFAULT_DATE_IDEAS with couple["dinner", "movie", "walk"]
```

### Formatting
```couplescript
# Proper spacing and indentation
argue love_level > 80 {
    remember "Perfect match!"
    marry celebration with love
} makeup {
    remember "Keep working on it!"
}

# Function parameter alignment
propose plan_perfect_date(
    partner_name, 
    preferred_activity, 
    budget_limit,
    weather_preference
) {
    # Function body
}
```

## 🚨 Common Errors and Solutions

### Type Errors
```couplescript
# Wrong: Trying to add string and number
marry result with "Age: " + age  # Error if age is number

# Correct: Convert number to string
marry result with "Age: " + to_string(age)
```

### Array Index Errors
```couplescript
# Wrong: Index out of bounds
marry item with my_array[10]  # Error if array has fewer elements

# Correct: Check array length first
argue length(my_array) > 10 {
    marry item with my_array[10]
} makeup {
    remember "Array too short!"
}
```

### Function Call Errors
```couplescript
# Wrong: Missing 'accept' keyword
marry result with calculate_love(name1, name2)

# Correct: Use 'accept' for function calls
marry result with accept calculate_love(name1, name2)
```

---

## 📖 Quick Reference

| Category | CoupleScript | Traditional | Example |
|----------|--------------|-------------|---------|
| **Variables** | `marry` | `=` | `marry name with "Romeo"` |
| **Delete** | `divorce` | `del` | `divorce old_variable` |
| **Function** | `propose` | `def` | `propose greet() { ... }` |
| **Call** | `accept` | call | `accept greet()` |
| **Return** | `promise` | `return` | `promise result` |
| **If** | `argue` | `if` | `argue x > 5 { ... }` |
| **Else** | `makeup` | `else` | `makeup { ... }` |
| **Loop** | `anniversary` | `while` | `anniversary i < 10 { ... }` |
| **Print** | `remember` | `print` | `remember "Hello!"` |
| **Input** | `whisper` | `input` | `whisper("Name? ")` |
| **True** | `love` | `true` | `marry happy with love` |
| **False** | `hate` | `false` | `marry sad with hate` |
| **Array** | `couple` | `[]` | `couple[1, 2, 3]` |
| **Object** | `memory` | `{}` | `memory{"key": "value"}` |

---

[← Back to Home](index.md) | [View Examples →](examples.md) | [Installation Guide →](installation.md)
