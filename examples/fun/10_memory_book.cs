# 📖 Digital Memory Book
# Create and view your relationship memories

marry memories with couple[]

propose add_memory(title, date, description) {
    marry new_memory with memory{
        "title": title,
        "date": date,
        "description": description,
        "created": today()
    }
    marry memories with memories + couple[new_memory]
    remember "Memory added: " + title
}

propose view_memories() {
    argue length(memories) == 0 {
        remember "No memories yet. Start creating some beautiful moments!"
        promise
    }
    
    remember "📖 Your Memory Book 📖"
    remember "══════════════════════"
    
    marry i with 0
    anniversary i < length(memories) {
        marry mem with memories[i]
        remember "\n💕 " + mem.title
        remember "   Date: " + mem.date
        remember "   " + mem.description
        marry i with i + 1
    }
}

propose memory_stats() {
    marry total with length(memories)
    remember "\n📊 Memory Statistics:"
    remember "Total memories: " + total
    
    argue total > 0 {
        marry latest with memories[total - 1]
        remember "Latest memory: " + latest.title
    }
}

# Sample memories
accept add_memory("First Date", "2023-02-14", "Had dinner at that cozy Italian place downtown")
accept add_memory("First Kiss", "2023-02-20", "Under the stars at the park")
accept add_memory("First 'I Love You'", "2023-04-15", "During our weekend getaway")

accept view_memories()
accept memory_stats()
