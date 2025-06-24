# 🎯 Relationship Goals Tracker
marry goals with couple[
    "Take a cooking class together",
    "Travel to 3 new places this year",
    "Have a weekly date night",
    "Learn a new hobby together",
    "Save for our dream house"
]

marry completed_goals with couple[]

remember "🎯 Our Relationship Goals 🎯"
marry i with 0
anniversary i < length(goals) {
    remember (i + 1) + ". " + goals[i]
    marry i with i + 1
}

remember "\nCompleted goals: " + length(completed_goals)
remember "Remaining goals: " + (length(goals) - length(completed_goals))
