# 💝 Couple's Quiz Game
# Test how well you know each other!

marry quiz_questions with couple[
    memory{
        "question": "What is your partner's favorite color?",
        "type": "text"
    },
    memory{
        "question": "When is your partner's birthday?",
        "type": "date"
    },
    memory{
        "question": "What is your partner's dream vacation destination?",
        "type": "text"
    },
    memory{
        "question": "What is your partner's favorite food?",
        "type": "text"
    },
    memory{
        "question": "What was your first date location?",
        "type": "text"
    }
]

marry score with 0
marry total_questions with length(quiz_questions)

propose ask_question(question_data) {
    remember "\n" + question_data.question
    marry user_answer with whisper("Your answer: ")
    
    # In a real implementation, you'd compare with stored answers
    marry correct with whisper("Was this correct? (love/hate): ")
    
    argue correct == "love" {
        marry score with score + 1
        remember "Correct! You know your partner well! 💕"
    } makeup {
        remember "Oops! Time to learn more about each other! 😊"
    }
}

remember "Welcome to the Couple's Quiz! 💑"
remember "Let's see how well you know your partner!\n"

marry i with 0
anniversary i < total_questions {
    accept ask_question(quiz_questions[i])
    marry i with i + 1
}

remember "\n🎉 Quiz Complete! 🎉"
marry percentage with (score * 100) / total_questions
remember "You scored " + score + " out of " + total_questions
remember "That's " + percentage + "% compatibility!"

argue percentage >= 80 {
    remember "Amazing! You two are perfectly in sync! 💕"
} makeup argue percentage >= 60 {
    remember "Great job! You know each other well! 😊"
} makeup {
    remember "Time for more date nights to learn about each other! 📚💖"
}
