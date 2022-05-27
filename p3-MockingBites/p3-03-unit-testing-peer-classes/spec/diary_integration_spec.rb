require 'diary'
require 'secret_diary'

RSpec.describe "integration test" do
  context "constructs" do
    it "initialises" do
      diary = Diary.new("Diary contents")
      secret = SecretDiary.new(diary)
      expect(secret).to be
    end  
  end

  context "unlocked diaries" do
    it "reads an unlocked diary" do
      diary = Diary.new("The unlocked contents")
      secret = SecretDiary.new(diary)
      expect(secret.read).to eq "The unlocked contents"
    end
  end

  context "locked diaries" do
    it "does not reads a locked diary" do
      diary = Diary.new("The locked contents")
      secret = SecretDiary.new(diary)
      secret.lock
      expect {secret.read}.to raise_error "Go away!"
    end

    it "reads the diary which was locked and then unlocked" do
      diary = Diary.new("The locked diary to be unlocked.")
      secret = SecretDiary.new(diary)
      secret.lock
      secret.unlock
      expect(secret.read).to eq "The locked diary to be unlocked."
    end
  end
end