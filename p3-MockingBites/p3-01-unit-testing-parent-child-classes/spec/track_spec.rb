require 'track'

RSpec.describe Track do
  it "returns false if a keyword does not match title or artist" do
    track1 = Track.new("Title", "Artist")
    expect(track1.matches?("Song")).to eq false
  end

  it "returns true if the title contains the keyword" do
    track1 = Track.new("Song Title", "Artist")
    expect(track1.matches?("Song")).to eq true
  end

  it "returns true if the title contains the keyword (different case)" do
    track1 = Track.new("Song Title", "Artist")
    expect(track1.matches?("song")).to eq true
  end

  it "returns true if the title contains the keyword as part of word" do
    track1 = Track.new("Song Title", "Artist")
    expect(track1.matches?("ong")).to eq true
  end

  it "returns true if the artist contains the keyword" do
    track1 = Track.new("Song Title", "The Great Artist")
    expect(track1.matches?("Great")).to eq true
  end

  it "returns true if the artist contains the keyword (different case)" do
    track1 = Track.new("Song Title", "The Great Artist")
    expect(track1.matches?("great")).to eq true
  end

  it "returns true if the artist contains the keyword as part of word" do
    track1 = Track.new("Song Title", "The Great Artist")
    expect(track1.matches?("art")).to eq true
  end

end