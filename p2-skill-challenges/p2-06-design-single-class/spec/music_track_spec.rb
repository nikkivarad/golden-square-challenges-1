require 'music_track'

RSpec.describe MusicTracks do
  it "adds a track" do
    musictracks = MusicTracks.new
    expect { musictracks.add("A song") }.to change {musictracks.show.length}.from(0).to(1)
  end
  
  it "show the added track" do
    musictracks = MusicTracks.new
    musictracks.add("A song")
    result = musictracks.show
    expect(result).to eq ["A song"]
  end

  it "shows additional songs added later" do
    musictracks = MusicTracks.new
    musictracks.add("A song")
    result = musictracks.show
    expect(result).to eq ["A song"]
    musictracks.add("A new song")
    musictracks.add("Imagine")
    expect(result).to eq ["A song", "A new song", "Imagine"]
  end
end

# As a user
# So that I can keep track of my music listening
# I want to add tracks I've listened to and see a list of them.