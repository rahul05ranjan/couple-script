# 🎁 Gift Reminder System
# Never forget another special occasion!

marry occasions with couple[
    memory{
        "name": "Anniversary",
        "date": anniversary_date(2024, 6, 15),
        "gift_ideas": couple["jewelry", "romantic dinner", "weekend getaway"]
    },
    memory{
        "name": "Valentine's Day",
        "date": anniversary_date(2024, 2, 14),
        "gift_ideas": couple["flowers", "chocolates", "love letter"]
    },
    memory{
        "name": "Birthday",
        "date": anniversary_date(2024, 8, 22),
        "gift_ideas": couple["surprise party", "favorite book", "personalized gift"]
    }
]

propose check_upcoming_occasions() {
    marry today_date with today()
    marry upcoming with couple[]
    
    marry i with 0
    anniversary i < length(occasions) {
        marry occasion with occasions[i]
        marry days_until with occasion.date - today_date
        
        argue days_until >= 0 && days_until <= 30 {
            marry upcoming with upcoming + couple[occasion]
        }
        marry i with i + 1
    }
    
    promise upcoming
}

propose suggest_gift(occasion) {
    marry random_index with random() % length(occasion.gift_ideas)
    promise occasion.gift_ideas[random_index]
}

remember "🎁 Gift Reminder System 🎁\n"

marry upcoming_occasions with accept check_upcoming_occasions()

argue length(upcoming_occasions) > 0 {
    remember "⚠️  Upcoming occasions to remember:"
    
    marry i with 0
    anniversary i < length(upcoming_occasions) {
        marry occasion with upcoming_occasions[i]
        marry days_until with occasion.date - today()
        
        remember "\n📅 " + occasion.name
        remember "   Date: " + occasion.date
        remember "   Days until: " + days_until
        
        marry suggested_gift with accept suggest_gift(occasion)
        remember "   💡 Gift idea: " + suggested_gift
        
        marry i with i + 1
    }
} makeup {
    remember "✅ No upcoming occasions in the next 30 days."
    remember "Enjoy your stress-free time! 😊"
}

remember "\n💝 Tip: Set reminders 2 weeks before important dates!"
