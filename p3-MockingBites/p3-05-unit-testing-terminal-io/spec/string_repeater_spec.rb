require 'string_repeater'

RSpec.describe StringRepeater do
  it "repeats the string for a given number of times" do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with('Hello. I will repeat a string many times.').ordered
    expect(terminal).to receive(:puts).with('Please enter a string').ordered
    expect(terminal).to receive(:gets).and_return("HelloABC").ordered
    expect(terminal).to receive(:puts).with('Please enter a number of repeats').ordered
    expect(terminal).to receive(:gets).and_return("3").ordered
    expect(terminal).to receive(:puts).with('Here is your result:').ordered
    expect(terminal).to receive(:puts).with("HelloABCHelloABCHelloABC").ordered
    
    string_repeater = StringRepeater.new(terminal)
    string_repeater.run
  end

  it "fails if non-integer is entered" do
    terminal = double :terminal
    expect(terminal).to receive(:puts).with('Hello. I will repeat a string many times.').ordered
    expect(terminal).to receive(:puts).with('Please enter a string').ordered
    expect(terminal).to receive(:gets).and_return("HelloABC").ordered
    expect(terminal).to receive(:puts).with('Please enter a number of repeats').ordered
    expect(terminal).to receive(:gets).and_return("three").ordered

    string_repeater = StringRepeater.new(terminal)
    expect{ string_repeater.run }.to raise_error "Please enter a number"
  end
end

# Hello. I will repeat a string many times.
# Please enter a string
# TWIX
# Please enter a number of repeats
# 10
# Here is your result:
# TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX