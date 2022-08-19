require 'diary'
require 'diary_entry'

RSpec.describe "Diary and entries" do
  it "makes a new entry into the diary" do
    diary = Diary.new
    entry1 = DiaryEntry.new("Title1", "Contents1", "12345678")
    diary.add(entry1)
    expect(diary.display_all_titles).to eq ["Title1"]
    expect(diary.display_all_phone_num).to eq ["12345678"]
  end

  it "makes multiple entries into the diary" do
    diary = Diary.new
    entry1 = DiaryEntry.new("Title1", "Contents1", "12345678")
    diary.add(entry1)
    str401 = "word " * 401
    entry2 = DiaryEntry.new("Title2", str401 , "23456789")
    diary.add(entry2)
    expect(diary.display_all_titles).to eq ["Title1", "Title2"]
    expect(diary.display_all_phone_num).to eq ["12345678", "23456789"]
  end

  it "display all phone numbers" do
    diary = Diary.new
    str201 = "word " * 201
    entry1 = DiaryEntry.new("Title1", str201 , "12345678")
    diary.add(entry1)
    str401 = "word " * 401
    entry2 = DiaryEntry.new("Title2", str401 , "23456789")
    diary.add(entry2)
    expect(diary.display_all_phone_num).to eq ["12345678", "23456789"]
  end

  it "searching for the entry to read now (within the given time and wpm)" do
    diary = Diary.new
    str201 = "word " * 201
    entry1 = DiaryEntry.new("Title1", str201 , "12345678")
    diary.add(entry1)
    str401 = "word " * 401
    entry2 = DiaryEntry.new("Title2", str401 , "23456789")
    diary.add(entry2)
    expect(diary.find_entries(200, 2)).to eq entry1
  end

  it "searching for the entry to read now (within the given time and wpm) 3 cases" do
    diary = Diary.new
    entry0 = DiaryEntry.new("Title1", "word" , "01234567")
    str201 = "word " * 201
    diary.add(entry0)
    entry1 = DiaryEntry.new("Title1", str201 , "12345678")
    diary.add(entry1)
    str401 = "word " * 401
    entry2 = DiaryEntry.new("Title2", str401 , "23456789")
    diary.add(entry2)
    expect(diary.find_entries(200, 2)).to eq entry1
  end
end