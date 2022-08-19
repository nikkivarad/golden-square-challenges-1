require 'diary'

RSpec.describe "Diary and entries" do
  it "makes a new diary with an empty array" do
    diary = Diary.new
    expect(diary.display_all_titles).to eq []
    expect(diary.display_all_phone_num).to eq []
  end

end