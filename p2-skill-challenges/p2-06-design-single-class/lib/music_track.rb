class MusicTracks
  def initialize
    @list = []
  end

  def show
    # to show all the tracks listened to
    # the list should be in an array, containing song names as strings
    return @list
  end

  def add(newtrack)
    # add newtrack to the list
    @list.push(newtrack)
  end
end