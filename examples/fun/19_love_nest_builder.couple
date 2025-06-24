# 🏠 Virtual Love Nest Builder
remember "🏠 Welcome to Virtual Love Nest Builder! 🏠"
remember "Design your dream home together!"
remember ""

marry rooms with couple["Living Room", "Kitchen", "Bedroom", "Garden"]
marry decorations with couple["Candles", "Photos", "Plants", "Art"]

remember "Choose rooms to decorate:"
marry i with 0
anniversary i < length(rooms) {
    remember (i + 1) + ". " + rooms[i]
    marry i with i + 1
}

marry room_choice with whisper("Pick a room (1-4): ")
marry decoration with decorations[random() % length(decorations)]

remember "\n🎨 Decorating the " + rooms[room_choice - 1] + " with " + decoration + "!"
remember "💕 Your love nest is looking beautiful! 💕"
