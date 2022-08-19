require 'keep_track_task'

RSpec.describe 'keep_track_task method' do
  context "empty string" do
    it "warns if input is empty string" do
      expect { keep_track_task("") }.to raise_error "Input is an empty string."
    end

    it "warns if input is nil" do
      expect { keep_track_task(nil) }.to raise_error "Input is an empty string."
    end
  end

  context "text includes #TODO string" do
    it "returns true if input has #TODO is in the beginning" do
      result = keep_track_task("#TODO Buy groceries")
      expect(result).to eq true
    end

    it "returns true if #TODO is present, but not in the beginning" do
      result = keep_track_task("Buy groceries #TODO")
      expect(result).to eq true
    end
  end

  context "text does not include #TODO" do
    it "returns false if only TODO is found" do
      result = keep_track_task("TODO Buy groceries")
      expect(result).to eq false
    end

    it "returns false if only TODO is found" do
      result = keep_track_task("#Buy groceries")
      expect(result).to eq false
    end

    it "returns false if only TODO is found" do
      result = keep_track_task("Buy groceries")
      expect(result).to eq false
    end
  end
end