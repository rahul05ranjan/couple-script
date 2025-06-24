# 🎵 Love Song Playlist Creator
# Generate perfect romantic playlists

marry romantic_classics with couple[
    "Can't Help Myself - Four Tops",
    "At Last - Etta James",
    "The Way You Look Tonight - Frank Sinatra",
    "Unchained Melody - The Righteous Brothers",
    "Stand By Me - Ben E. King",
    "I Only Have Eyes for You - The Flamingos"
]

marry modern_love_songs with couple[
    "Perfect - Ed Sheeran",
    "All of Me - John Legend",
    "Marry Me - Train",
    "A Thousand Years - Christina Perri",
    "Thinking Out Loud - Ed Sheeran",
    "Make You Feel My Love - Adele"
]

marry slow_dance_songs with couple[
    "At Last - Etta James",
    "The Way You Look Tonight - Frank Sinatra",
    "La Vie En Rose - Édith Piaf",
    "Moon River - Audrey Hepburn",
    "Fly Me to the Moon - Frank Sinatra",
    "Dream a Little Dream - Ella Fitzgerald"
]

propose create_playlist(mood, song_count) {
    marry playlist with couple[]
    marry source_songs with couple[]
    
    argue mood == "classic" {
        marry source_songs with romantic_classics
    } makeup argue mood == "modern" {
        marry source_songs with modern_love_songs
    } makeup argue mood == "dance" {
        marry source_songs with slow_dance_songs
    } makeup {
        marry source_songs with romantic_classics + modern_love_songs + slow_dance_songs
    }
    
    marry i with 0
    anniversary i < song_count && i < length(source_songs) {
        marry random_index with random() % length(source_songs)
        marry selected_song with source_songs[random_index]
        marry playlist with playlist + couple[selected_song]
        marry i with i + 1
    }
    
    promise playlist
}

remember "🎵 Love Song Playlist Creator 🎵\n"
remember "Choose your romantic mood:"
remember "1. Classic Romance"
remember "2. Modern Love"
remember "3. Slow Dance"
remember "4. Mixed Playlist"

marry mood_choice with whisper("\nEnter your choice (1-4): ")
marry song_count with whisper("How many songs (1-10): ")

marry mood with "mixed"
argue mood_choice == "1" {
    marry mood with "classic"
} makeup argue mood_choice == "2" {
    marry mood with "modern"
} makeup argue mood_choice == "3" {
    marry mood with "dance"
}

marry playlist with accept create_playlist(mood, song_count)

remember "\n🎶 Your Romantic Playlist 🎶"
remember "═══════════════════════════════"

marry i with 0
anniversary i < length(playlist) {
    remember (i + 1) + ". " + playlist[i]
    marry i with i + 1
}

remember "\n💕 Perfect for your next romantic evening! 💕"
