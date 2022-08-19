class DiaryEntry
  def initialize(title, contents, phone)
    @title = title
    @contents = contents
    @phone = phone
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def phone
    @phone
  end

  def word_count
    # returns the the word count (an integer) of the entry
    return @contents.split(" ").length
  end
  
  def reading_time(wpm)
    # wpm is an integer
    # returns the time (integer) needed for reading the whole contents according to its word counts
    return (self.word_count / wpm.to_f).ceil
  end
end