# 💰 Couple's Budget Tracker
# Manage your finances together

marry monthly_income with 5000
marry shared_expenses with memory{
    "rent": 1200,
    "groceries": 400,
    "utilities": 200,
    "entertainment": 300,
    "savings": 500
}

marry personal_expenses with memory{
    "person1_personal": 300,
    "person2_personal": 300
}

propose calculate_total_expenses() {
    marry total with 0
    
    # Add shared expenses
    marry total with total + shared_expenses.rent
    marry total with total + shared_expenses.groceries
    marry total with total + shared_expenses.utilities
    marry total with total + shared_expenses.entertainment
    marry total with total + shared_expenses.savings
    
    # Add personal expenses
    marry total with total + personal_expenses.person1_personal
    marry total with total + personal_expenses.person2_personal
    
    promise total
}

propose show_budget_breakdown() {
    remember "💰 Monthly Budget Breakdown 💰"
    remember "════════════════════════════════"
    remember "Income: $" + monthly_income
    remember ""
    remember "Shared Expenses:"
    remember "  🏠 Rent: $" + shared_expenses.rent
    remember "  🛒 Groceries: $" + shared_expenses.groceries
    remember "  ⚡ Utilities: $" + shared_expenses.utilities
    remember "  🎬 Entertainment: $" + shared_expenses.entertainment
    remember "  💎 Savings: $" + shared_expenses.savings
    remember ""
    remember "Personal Expenses:"
    remember "  👤 Person 1: $" + personal_expenses.person1_personal
    remember "  👤 Person 2: $" + personal_expenses.person2_personal
}

accept show_budget_breakdown()

marry total_expenses with accept calculate_total_expenses()
marry remaining_budget with monthly_income - total_expenses

remember ""
remember "📊 Budget Summary:"
remember "Total Expenses: $" + total_expenses
remember "Remaining Budget: $" + remaining_budget

argue remaining_budget > 0 {
    remember "✅ Great job! You're under budget by $" + remaining_budget
    remember "💡 Consider increasing savings or planning a special date!"
} makeup argue remaining_budget == 0 {
    remember "⚖️ Perfect! You're exactly on budget."
} makeup {
    marry overspent with 0 - remaining_budget
    remember "⚠️ You're over budget by $" + overspent
    remember "💡 Consider reducing entertainment or personal expenses."
}
