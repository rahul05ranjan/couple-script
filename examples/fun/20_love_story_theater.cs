# 🎭 Love Story Theater
remember "🎭 Welcome to Love Story Theater! 🎭"
remember "Act out your favorite romantic scenes!"
remember ""

marry scenes with couple[
    "Romeo and Juliet balcony scene",
    "Titanic 'I'm flying' scene", 
    "The Notebook rain scene",
    "Pride and Prejudice proposal",
    "Casablanca goodbye scene"
]

remember "Choose your romantic scene:"
marry i with 0
anniversary i < length(scenes) {
    remember (i + 1) + ". " + scenes[i]
    marry i with i + 1
}

marry choice with whisper("Pick a scene (1-5): ")

remember "\n🎬 Setting the stage for: " + scenes[choice - 1]
remember "🌟 Break a leg, lovebirds! 🌟"
remember "💕 Remember: The best love stories are your own! 💕"
