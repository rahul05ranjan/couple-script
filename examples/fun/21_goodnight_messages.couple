# 🌙 Goodnight Love Messages
marry goodnight_messages with couple[
    "Sweet dreams, my love! 💕",
    "Sleep tight, thinking of you! 🌙",
    "Goodnight to the person who makes my heart smile! ✨",
    "Dream of us dancing under the stars! 💃🕺",
    "Rest well, my beautiful soul! 😴💖"
]

marry random_message with goodnight_messages[random() % length(goodnight_messages)]
remember "🌙 Tonight's goodnight message:"
remember random_message

marry current_hour with hour(now())
argue current_hour >= 21 || current_hour <= 6 {
    remember "\n💤 Perfect timing for a goodnight message!"
} makeup {
    remember "\n☀️ Maybe save this for tonight! It's only " + current_hour + ":00"
}
