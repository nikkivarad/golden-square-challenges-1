require 'diary'

RSpec.describe Diary do
  it "initialises" do
    diary = Diary.new("Contents")
    expect(diary).to be
  end

  it "returns contents" do
    diary = Diary.new("Contents")
    expect(diary.read).to eq ("Contents")
  end
end  