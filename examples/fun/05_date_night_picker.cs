# 🎲 Date Night Picker
# Random romantic date ideas generator

marry indoor_dates with couple[
    "Cook a romantic dinner together",
    "Have a movie marathon with favorite films",
    "Play board games by candlelight",
    "Give each other massages",
    "Write love letters to each other",
    "Create a photo album of memories",
    "Have a dance party in the living room",
    "Try a wine tasting at home"
]

marry outdoor_dates with couple[
    "Go for a romantic walk in the park",
    "Have a picnic under the stars",
    "Visit a local farmers market",
    "Go hiking together",
    "Watch the sunset from a scenic spot",
    "Go to an outdoor concert",
    "Visit a botanical garden",
    "Go stargazing"
]

marry adventure_dates with couple[
    "Go rock climbing",
    "Try a new sport together",
    "Go on a road trip",
    "Visit an escape room",
    "Go kayaking or canoeing",
    "Try a cooking class",
    "Go to a comedy show",
    "Visit a museum or art gallery"
]

propose pick_random_date(date_category) {
    marry random_index with random() % length(date_category)
    promise date_category[random_index]
}

remember "🎲 Date Night Picker 🎲\n"
remember "What kind of date are you in the mood for?\n"
remember "1. Indoor & Cozy"
remember "2. Outdoor & Nature"
remember "3. Adventure & Fun"

marry choice with whisper("\nEnter your choice (1-3): ")

argue choice == "1" {
    marry selected_date with accept pick_random_date(indoor_dates)
    remember "🏠 Tonight's romantic indoor date idea:"
    remember "💕 " + selected_date
} makeup argue choice == "2" {
    marry selected_date with accept pick_random_date(outdoor_dates)
    remember "🌳 Tonight's beautiful outdoor date idea:"
    remember "🌟 " + selected_date
} makeup argue choice == "3" {
    marry selected_date with accept pick_random_date(adventure_dates)
    remember "🎢 Tonight's exciting adventure date idea:"
    remember "⚡ " + selected_date
} makeup {
    remember "💫 Surprise! Here's a random date idea from all categories:"
    marry all_dates with indoor_dates + outdoor_dates + adventure_dates
    marry surprise_date with accept pick_random_date(all_dates)
    remember "✨ " + surprise_date
}

remember "\nHave a wonderful time together! 💖"
