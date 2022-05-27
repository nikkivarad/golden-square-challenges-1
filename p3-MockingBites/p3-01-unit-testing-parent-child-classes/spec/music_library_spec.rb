require 'music_library'

RSpec.describe MusicLibrary do
  it "shows empty array if no track added" do
    library = MusicLibrary.new
    expect(library.all).to eq []
  end

  it "shows added track (one added)" do
    library = MusicLibrary.new
    track1 = double :track
    library.add(track1)
    expect(library.all).to eq [track1]
  end

  it "shows added track (multiple added)" do
    library = MusicLibrary.new
    track1 = double :track
    track2 = double :track
    track3 = double :track
    library.add(track1)
    library.add(track2)
    library.add(track3)
    expect(library.all).to eq [track1, track2, track3]
  end

  it "searches for keywoard - returns nothing when no track match" do
    library = MusicLibrary.new
    track1 = double :track, matches?: false
    track2 = double :track, matches?: false
    track3 = double :track, matches?: false
    library.add(track1)
    library.add(track2)
    library.add(track3)
    expect(library.search("Song")).to eq []
  end

  it "searches for keywoard - returns the one track match" do
    library = MusicLibrary.new
    track1 = double :track, matches?: false
    track2 = double :track, matches?: true
    track3 = double :track, matches?: false
    library.add(track1)
    library.add(track2)
    library.add(track3)
    expect(library.search("Song")).to eq [track2]
  end

  it "searches for keywoard - returns the multiple track match" do
    library = MusicLibrary.new
    track1 = double :track, matches?: false
    track2 = double :track, matches?: true
    track3 = double :track, matches?: true
    library.add(track1)
    library.add(track2)
    library.add(track3)
    expect(library.search("Song")).to eq [track2, track3]
  end

end