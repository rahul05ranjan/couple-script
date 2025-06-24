# 🎮 Couple's Game Night
remember "🎮 Welcome to Couple's Game Night! 🎮"
remember "Choose your game:"
remember "1. 20 Questions About Each Other"
remember "2. Would You Rather (Couple Edition)"
remember "3. Memory Lane Quiz"

marry choice with whisper("Pick a game (1-3): ")

argue choice == "1" {
    remember "💭 20 Questions About Each Other"
    remember "Take turns asking personal questions!"
    remember "Sample: What's my biggest dream?"
} makeup argue choice == "2" {
    remember "🤔 Would You Rather (Couple Edition)"
    remember "Would you rather have dinner by candlelight or under the stars?"
} makeup {
    remember "🧠 Memory Lane Quiz"
    remember "Question: Where was our first date?"
}
