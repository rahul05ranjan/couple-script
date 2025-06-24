# 🎨 Fun Examples Gallery

Welcome to our collection of 20+ romantic and fun CoupleScript programs! Each example demonstrates different aspects of the language while keeping the romantic theme that makes CoupleScript special.

## 💕 Basic Romance Examples

### 1. Love Calculator
**File**: [`01_love_calculator.couple`](examples/fun/01_love_calculator.couple)

Calculate the compatibility between two people based on their names.

```couplescript
propose calculate_love_percentage(name1, name2) {
    marry total with 0
    # Add character codes from both names
    marry i with 0
    anniversary i < length(name1) {
        marry total with total + char_code(name1[i])
        marry i with i + 1
    }
    # Calculate compatibility percentage
    promise (total % 100) + 1
}

marry percentage with accept calculate_love_percentage("Romeo", "Juliet")
remember "Love compatibility: " + percentage + "%"
```

### 2. Date Planner
**File**: [`02_date_planner.couple`](examples/fun/02_date_planner.couple)

Plan the perfect romantic date with personalized suggestions.

```couplescript
marry date_ideas with couple[
    "Candlelit dinner at home",
    "Stargazing in the park", 
    "Cooking class together",
    "Movie night with favorites"
]

marry random_date with date_ideas[random() % length(date_ideas)]
remember "Tonight's perfect date: " + random_date
```

## 🎮 Interactive Games

### 3. Couple's Quiz
**File**: [`03_couples_quiz.couple`](examples/fun/03_couples_quiz.couple)

Test how well you know each other with this interactive quiz game.

### 4. Game Night Collection
**File**: [`13_couples_game_night.couple`](examples/fun/13_couples_game_night.couple)

Multiple games in one: 20 Questions, Would You Rather, and Memory Lane Quiz.

### 5. Love Champion Trivia
**File**: [`17_love_champion_game.couple`](examples/fun/17_love_champion_game.couple)

Test your knowledge of love and relationship facts.

### 6. Romance Adventure Game
**File**: [`18_romance_adventure.couple`](examples/fun/18_romance_adventure.couple)

Choose your own romantic adventure with multiple storylines.

## 📋 Planning & Organization

### 7. Gift Reminder System
**File**: [`04_gift_reminder.couple`](examples/fun/04_gift_reminder.couple)

Never forget another anniversary or special occasion.

```couplescript
marry occasions with couple[
    memory{
        "name": "Anniversary",
        "date": anniversary_date(2024, 6, 15),
        "gift_ideas": couple["jewelry", "romantic dinner", "weekend getaway"]
    }
]
```

### 8. Proposal Planner
**File**: [`07_proposal_planner.couple`](examples/fun/07_proposal_planner.couple)

Plan the perfect marriage proposal with location ideas and checklists.

### 9. Travel Romance Planner
**File**: [`09_travel_planner.couple`](examples/fun/09_travel_planner.couple)

Plan romantic getaways to destinations around the world.

### 10. Wedding Task Manager
From the basic examples: organize your entire wedding with task tracking.

## 💰 Practical Tools

### 11. Couple's Budget Tracker
**File**: [`08_couples_budget.couple`](examples/fun/08_couples_budget.couple)

Manage your finances together with shared expense tracking.

### 12. Relationship Goals Tracker
**File**: [`11_relationship_goals.couple`](examples/fun/11_relationship_goals.couple)

Set and track goals for your relationship growth.

## 🎵 Creative & Entertainment

### 13. Love Song Playlist Creator
**File**: [`06_love_song_playlist.couple`](examples/fun/06_love_song_playlist.couple)

Generate perfect romantic playlists for any mood.

### 14. Date Night Picker
**File**: [`05_date_night_picker.couple`](examples/fun/05_date_night_picker.couple)

Random date idea generator with indoor, outdoor, and adventure options.

### 15. Love Poem Generator
**File**: [`15_love_poem_generator.couple`](examples/fun/15_love_poem_generator.couple)

Create personalized romantic poetry.

```couplescript
marry love_words with couple["beautiful", "amazing", "wonderful", "perfect"]
marry word1 with love_words[random() % length(love_words)]
remember "You are " + word1 + ", and you have my heart"
```

### 16. Recipe for Love
**File**: [`14_recipe_for_love.couple`](examples/fun/14_recipe_for_love.couple)

Romantic cooking suggestions and tips for couples.

## 🏠 Lifestyle & Memories

### 17. Digital Memory Book
**File**: [`10_memory_book.couple`](examples/fun/10_memory_book.couple)

Create and browse your relationship memories and milestones.

### 18. Virtual Love Nest Builder
**File**: [`19_love_nest_builder.couple`](examples/fun/19_love_nest_builder.couple)

Design your dream home together with virtual room decoration.

### 19. Love Story Theater
**File**: [`20_love_story_theater.couple`](examples/fun/20_love_story_theater.couple)

Act out famous romantic scenes from movies and literature.

## 📊 Analysis & Insights

### 20. Love Horoscope Generator
**File**: [`12_love_horoscope.couple`](examples/fun/12_love_horoscope.couple)

Daily romantic predictions based on zodiac compatibility.

### 21. Relationship Analyzer
**File**: [`16_relationship_analyzer.couple`](examples/fun/16_relationship_analyzer.couple)

Analyze relationship patterns and statistics.

```couplescript
marry relationship_data with memory{
    "months_together": 18,
    "dates_per_month": 4,
    "inside_jokes": 37
}

marry total_dates with relationship_data.months_together * relationship_data.dates_per_month
remember "Total dates: " + total_dates
```

## 🚀 How to Run These Examples

### Prerequisites
Make sure you have CoupleScript installed. If not, see our [Installation Guide](installation.md).

### Running an Example
```bash
# Windows
.\couplescript.bat examples\fun\01_love_calculator.couple

# Linux/Mac
./couplescript examples/fun/01_love_calculator.couple
```

### Interactive Mode
Many examples support interactive mode where you can input your own data:

```bash
# Windows
.\couplescript.bat examples\fun\03_couples_quiz.couple

# Linux/Mac  
./couplescript examples/fun/03_couples_quiz.couple
```

## 💡 Create Your Own

Inspired by these examples? Create your own romantic programs! Here are some ideas:

- **Anniversary Countdown**: Count days until special dates
- **Love Letter Generator**: Create personalized love letters
- **Couple's Bucket List**: Track adventures you want to share
- **Relationship Journal**: Digital diary for couples
- **Date Rating System**: Rate and remember your favorite dates
- **Gift Wishlist Manager**: Keep track of gift ideas for each other
- **Love Language Quiz**: Discover each other's love languages
- **Romantic Recipe Book**: Collection of recipes to cook together

## 📚 Learning from Examples

Each example demonstrates different CoupleScript features:

- **Variables**: Using `marry` for data storage
- **Functions**: Creating reusable code with `propose` and `accept`
- **Conditionals**: Making decisions with `argue` and `makeup`
- **Loops**: Repeating actions with `anniversary`
- **Data Structures**: Using `couple` (arrays) and `memory` (objects)
- **User Input**: Getting input with `whisper`
- **Output**: Displaying results with `remember`

## 🌟 Contributing Examples

Have a fun romantic programming idea? We'd love to add it to our collection!

1. Fork the repository
2. Create your example in `examples/fun/`
3. Add documentation here
4. Submit a pull request

Let's make programming more romantic together! 💕

---

[← Back to Home](index.md) | [View Source Code →](https://github.com/rahul05ranjan/couple-script/tree/main/examples/fun)
