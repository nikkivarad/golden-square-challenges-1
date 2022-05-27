# File: lib/music_library.rb

class MusicLibrary
  def initialize
    @library =[]
  end

  def add(track) # track is an instance of Track
    # Track gets added to the library
    # Returns nothing
    @library.push(track)
  end

  def all
    # Returns a list of track objects
    @library
  end
  
  def search(keyword) # keyword is a string
    # Returns a list of tracks that match the keyword
    @library.select{|track| track.matches?(keyword)}
  end
end