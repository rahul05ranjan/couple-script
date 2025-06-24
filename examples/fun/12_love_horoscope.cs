# ⭐ Love Horoscope Generator
marry zodiac_signs with couple["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]

marry love_predictions with couple[
    "Your love will bloom like spring flowers today",
    "A romantic surprise awaits you this week", 
    "Communication is key to deepening your bond",
    "Plan a special evening together",
    "Your relationship will reach new heights"
]

marry compatibility_tips with couple[
    "Listen with your heart today",
    "Express gratitude for your partner",
    "Try something new together",
    "Show affection through small gestures"
]

remember "⭐ Daily Love Horoscope ⭐"
marry your_sign with whisper("Enter your zodiac sign: ")
marry partner_sign with whisper("Enter partner's sign: ")

marry prediction_index with random() % length(love_predictions)
marry tip_index with random() % length(compatibility_tips)

remember "\n💕 Today's Love Forecast:"
remember "For " + your_sign + " & " + partner_sign + ":"
remember love_predictions[prediction_index]
remember "\n💡 Relationship Tip:"
remember compatibility_tips[tip_index]
