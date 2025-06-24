# 💍 Proposal Planner
# Plan the perfect marriage proposal

marry proposal_ideas with couple[
    memory{
        "type": "romantic",
        "location": "favorite restaurant",
        "description": "Arrange with restaurant to bring ring with dessert"
    },
    memory{
        "type": "adventurous", 
        "location": "hiking trail",
        "description": "Propose at scenic overlook during sunrise"
    },
    memory{
        "type": "intimate",
        "location": "home",
        "description": "Cook favorite meal and propose during candlelit dinner"
    },
    memory{
        "type": "creative",
        "location": "art gallery",
        "description": "Commission custom art piece and propose when revealed"
    }
]

marry preparation_checklist with couple[
    "Buy the ring",
    "Choose the perfect location",
    "Plan what to say",
    "Coordinate with photographer",
    "Inform close family",
    "Prepare celebration plans",
    "Check weather forecast",
    "Practice the speech"
]

propose get_proposal_idea(preference) {
    marry matching_ideas with couple[]
    
    marry i with 0
    anniversary i < length(proposal_ideas) {
        marry idea with proposal_ideas[i]
        argue idea.type == preference {
            marry matching_ideas with matching_ideas + couple[idea]
        }
        marry i with i + 1
    }
    
    argue length(matching_ideas) > 0 {
        marry random_index with random() % length(matching_ideas)
        promise matching_ideas[random_index]
    } makeup {
        marry random_index with random() % length(proposal_ideas)
        promise proposal_ideas[random_index]
    }
}

remember "💍 Perfect Proposal Planner 💍\n"
remember "What type of proposal are you thinking?"
remember "1. Romantic & Classic"
remember "2. Adventurous & Outdoor" 
remember "3. Intimate & Private"
remember "4. Creative & Unique"

marry choice with whisper("\nEnter your choice (1-4): ")

marry preference with "romantic"
argue choice == "2" {
    marry preference with "adventurous"
} makeup argue choice == "3" {
    marry preference with "intimate"  
} makeup argue choice == "4" {
    marry preference with "creative"
}

marry selected_idea with accept get_proposal_idea(preference)

remember "\n✨ Your Perfect Proposal Plan ✨"
remember "Type: " + selected_idea.type
remember "Location: " + selected_idea.location
remember "Idea: " + selected_idea.description

remember "\n📋 Preparation Checklist:"
marry i with 0
anniversary i < length(preparation_checklist) {
    remember "□ " + preparation_checklist[i]
    marry i with i + 1
}

remember "\n💕 Best of luck with your proposal! 💕"
