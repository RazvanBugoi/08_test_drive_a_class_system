# 1 - returns all diary entries
diary = Diary.new
entry_1 = DiaryEntry.new("First Entry", "I love summer")
entry_2 = DiaryEntry.new("Second Entry", "I love programming")
diary.add(entry_1)
diary.add(entry_2)
diary.all #=> [entry_1, entry_2]

# 2 - returns the number of words in all diary entries
diary = Diary.new
entry_1 = DiaryEntry.new("First Entry", "I love summer")
entry_2 = DiaryEntry.new("Second Entry", "I love programming")
diary.add(entry_1)
diary.add(entry_2)
diary.count_words #=> 10

# 3 - Returns an integer representing an estimate of the reading time in minutes if the user were to read all entries in the diary.
diary = Diary.new
entry_1 = DiaryEntry.new("First Entry", "I love summer")
entry_2 = DiaryEntry.new("Second Entry", "I love programming")
diary.add(entry_1)
diary.add(entry_2)
diary.reading_time(2) #=> 5

# 4 - Returns an instance of diary entry representing the entry that is closest to, but not over, the length that the user could read in the minutes they have available given their reading speed.
diary = Diary.new
entry_1 = DiaryEntry.new("First Entry", "I love summer")
entry_2 = DiaryEntry.new("Second Entry", "I love programming in Ruby")
entry_3 = DiaryEntry.new("Third Entry", "This is the longest entry so far in this diary")
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.find_best_entry_for_reading_time(2, 3) #=> ["First Entry", "I love summer"]

# 5 - Returns the title as a string
entry = DiaryEntry.new("First Entry", "I love summer")
entry.title() #=> "First Entry"

#6 - Return the contents as a string
entry = DiaryEntry.new("First Entry", "I love summer")
entry.contents() #=> "I love summer"

#7 - Returns the number of words in the contents as an integer
entry = DiaryEntry.new("First Entry", "I love summer")
entry.count_words() #=> 3

#8 - Returns an integer representing an estimate of the reading time in minutes for the contents at the given wpm.
entry = DiaryEntry.new("First Entry", "I love summer")
entry.reading_time(1) #=> 3

#9 - Returns a string with a chunk of the contents that the user could read in the given number of minutes.
entry = DiaryEntry.new("First Entry", "I love summer")
entry.reading_chunk(1, 2) #=> "I love"

#10 - If called again, `reading_chunk` should return the next chunk, skipping what has already been read, until the contents is fully read.
    - #The next call after that it should restart from the beginning.
entry = DiaryEntry.new("First Entry", "I need a long sentence to demonstrate the example.")
entry.reading_chunk(1, 2) #=> "I need"
entry.reading_chunk(1, 2) #=> "a long"
entry.reading_chunk(1, 2) #=> "sentence to"
entry.reading_chunk(1, 2) #=> "demonstrate the"
entry.reading_chunk(1, 2) #=> "example"
entry.reading_chunk(1, 2) #=> "I need"