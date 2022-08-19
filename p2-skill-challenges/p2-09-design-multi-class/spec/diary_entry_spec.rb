require 'diary_entry'

RSpec.describe DiaryEntry do
  it "Constructs a new entry" do
    str401 = "word " * 401
    entry1 = DiaryEntry.new("Title1", str401 , "12345678")
    expect(entry1.contents).to eq str401
    expect(entry1.title).to eq "Title1"
    expect(entry1.phone).to eq "12345678"
  end

  it "calculate word count" do
    str401 = "word " * 401
    entry1 = DiaryEntry.new("Title1", str401 , "12345678")
    expect(entry1.word_count).to eq 401
  end

  it "calculate reading time" do
    str401 = "word " * 401
    entry1 = DiaryEntry.new("Title1", str401 , "12345678")
    expect(entry1.reading_time(200)).to eq 3
  end
end