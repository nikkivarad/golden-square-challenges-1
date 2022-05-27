require 'taskformatter'

RSpec.describe TaskFormatter do
  context "initialisation" do
    it "constructs" do
      task = double(:Task)
      formatter = TaskFormatter.new(task)
      expect(formatter).to be
    end
  end

  context "Formatting" do
    it "returns the formatted incomplete task as a string" do
      task = double(:Task, title: "Buy milk", complete?: false)
      formatter = TaskFormatter.new(task)
      expect(formatter.format).to eq ("- [ ] Buy milk")
    end

    it "returns the formatted completed task as a string" do
      task = double(:Task, title: "Buy milk", complete?: true)
      formatter = TaskFormatter.new(task)
      expect(formatter.format).to eq ("- [x] Buy milk")
    end
  end
end