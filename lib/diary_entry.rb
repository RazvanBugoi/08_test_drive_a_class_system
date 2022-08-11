class DiaryEntry
    def initialize(title, contents) 
        @title = title
        @contents = contents
    end
  
    def title
      return @title
    end
  
    def contents
      return @contents
    end
  
    def count_words
      return 0 if @contents.empty?
      return contents.count(" ") + 1
    end
  
    def reading_time(wpm) 
        fail "WPM must be positive." unless wpm.positive?
        return (count_words / wpm.to_f).ceil
    end
  
    def reading_chunk(wpm, minutes) 
        # `wpm` is an integer representing the number
        # of words the user can read per minute
        # `minutes` is an integer representing the
        # number of minutes the user has to read
        # Returns a string with a chunk of the contents that the user could read
        # in the given number of minutes.
        # If called again, `reading_chunk` should return the next chunk, skipping
        # what has already been read, until the contents is fully read.
        # The next call after that it should restart from the beginning.
    end
end