require 'music_library'
require 'track'

RSpec.describe 'integration test' do
  it "shows added track (one added)" do
    library = MusicLibrary.new
    track1 = Track.new("Title1", "Artist1")
    library.add(track1)
    expect(library.all).to eq [track1]
  end


  it "shows added track (multiple added)" do
    library = MusicLibrary.new
    track1 = Track.new("Title1", "Artist1")
    track2 = Track.new("Title2", "Artist2")
    track3 = Track.new("Title3", "Artist3")
    library.add(track1)
    library.add(track2)
    library.add(track3)
    expect(library.all).to eq [track1, track2, track3]
  end

  it "searches for keywoard - returns nothing when no track with such name" do
    library = MusicLibrary.new
    track1 = Track.new("Title1", "Artist1")
    track2 = Track.new("Title2", "Artist2")
    track3 = Track.new("Title3", "Artist3")
    expect(library.search("Song")).to eq []
  end


  it "searches for keywoard - returns the one track match" do
    library = MusicLibrary.new
    track1 = Track.new("Title1", "Artist1")
    track2 = Track.new("The good song", "Artist2")
    track3 = Track.new("Title3", "Artist3")
    library.add(track1)
    library.add(track2)
    library.add(track3)
    expect(library.search("Song")).to eq [track2]
  end

  it "searches for keywoard - returns the multiple track match" do
    library = MusicLibrary.new
    track1 = Track.new("Title1", "Artist1")
    track2 = Track.new("The Good song", "Artist2")
    track3 = Track.new("Title3", "The not-so-good artist")
    library.add(track1)
    library.add(track2)
    library.add(track3)
    expect(library.search("good")).to eq [track2, track3]
  end
end