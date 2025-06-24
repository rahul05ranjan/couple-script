# ✈️ Travel Romance Planner
# Plan the perfect romantic getaway

marry destinations with couple[
    memory{"name": "Paris", "type": "romantic", "activities": couple["Eiffel Tower", "Seine cruise", "Louvre"]},
    memory{"name": "Venice", "type": "romantic", "activities": couple["Gondola rides", "St. Mark's Square", "Bridge of Sighs"]},
    memory{"name": "Santorini", "type": "scenic", "activities": couple["Sunset viewing", "Wine tasting", "Beach walks"]},
    memory{"name": "Tokyo", "type": "adventure", "activities": couple["Temple visits", "Sushi tours", "Cherry blossoms"]},
    memory{"name": "Bali", "type": "relaxing", "activities": couple["Spa treatments", "Rice terraces", "Beach sunset"]}
]

propose plan_romantic_trip(destination_type, duration) {
    marry matching_destinations with couple[]
    marry i with 0
    anniversary i < length(destinations) {
        marry dest with destinations[i]
        argue dest.type == destination_type {
            marry matching_destinations with matching_destinations + couple[dest]
        }
        marry i with i + 1
    }
    
    argue length(matching_destinations) > 0 {
        marry random_index with random() % length(matching_destinations)
        promise matching_destinations[random_index]
    } makeup {
        marry random_index with random() % length(destinations)
        promise destinations[random_index]
    }
}

remember "✈️ Romantic Travel Planner ✈️\n"
remember "What type of romantic getaway do you want?"
remember "1. Classic Romance"
remember "2. Scenic Beauty"
remember "3. Adventure Together"
remember "4. Relaxing Retreat"

marry choice with whisper("Enter choice (1-4): ")
marry duration with whisper("How many days: ")

marry trip_type with "romantic"
argue choice == "2" {
    marry trip_type with "scenic"
} makeup argue choice == "3" {
    marry trip_type with "adventure"
} makeup argue choice == "4" {
    marry trip_type with "relaxing"
}

marry selected_destination with accept plan_romantic_trip(trip_type, duration)

remember "\n🌟 Your Perfect Romantic Getaway 🌟"
remember "Destination: " + selected_destination.name
remember "Type: " + selected_destination.type
remember "Duration: " + duration + " days"
remember "\n🎯 Recommended Activities:"

marry i with 0
anniversary i < length(selected_destination.activities) {
    remember "• " + selected_destination.activities[i]
    marry i with i + 1
}

remember "\n💕 Have an amazing romantic trip! 💕"
