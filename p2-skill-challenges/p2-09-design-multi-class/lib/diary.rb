class Diary
  def initialize
    @diary = []
  end

  def add(entry)
    @diary.push(entry)
  end

  def find_entries(wpm, time)
    # wpm (word per minute) and time should be integer
    # returns the approriate entry (longest entry with readinging time no exceeding the available time)
    output = nil
    max_time = 0
    @diary.each {|entry|
      if entry.reading_time(wpm) <= time && max_time < entry.reading_time(wpm)
        output = entry
        max_time = entry.reading_time(wpm)
      end
    }
    return output
  end

  def display_all_titles
    output = []
    @diary.map {|entry|
      output.push(entry.title)
    }
    return output
  end

  def display_all_phone_num
    output = []
    @diary.map {|entry|
      output.push(entry.phone)
    }
    return output
  end
end