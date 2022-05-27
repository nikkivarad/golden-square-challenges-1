require 'calculator'

RSpec.describe InteractiveCalculator do
  context "doubling inputs" do
    it "calculates simple subtractions and return the answer" do
      io = double :fake_io
      expect(io).to receive(:puts).with("Hello. I will subtract two numbers.")
      expect(io).to receive(:puts).with("Please enter a number")
      expect(io).to receive(:gets).and_return("4")
      expect(io).to receive(:puts).with("Please enter another number")
      expect(io).to receive(:gets).and_return("3")
      expect(io).to receive(:puts).with("Here is your result:")
      expect(io).to receive(:puts).with("4 - 3 = 1")

      calculator = InteractiveCalculator.new(io)
      calculator.run
    end
  end
end


# Hello. I will subtract two numbers.
# Please enter a number
# 4
# Please enter another number
# 3
# Here is your result:
# 4 - 3 = 1
