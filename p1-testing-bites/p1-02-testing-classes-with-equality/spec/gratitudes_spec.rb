require 'gratitudes'

RSpec.describe Gratitudes do
  it "initialises with an empty array" do
    gratitude = Gratitudes.new
    result = gratitude.format
    expect(result).to eq "Be grateful for: "
  end

  it "displays gratitude to Mary" do
    gratitude = Gratitudes.new
    gratitude.add("Mary")
    result = gratitude.format
    expect(result).to eq "Be grateful for: Mary"
  end

  it "displays gratitude to Mary and Peter" do
    gratitude = Gratitudes.new
    gratitude.add("Mary")
    gratitude.add("Peter")
    result = gratitude.format
    expect(result).to eq "Be grateful for: Mary, Peter"
  end

  it "displays gratitude to Mary, Joseph, Peter" do
    gratitude = Gratitudes.new
    gratitude.add("Mary")
    gratitude.add("Joseph")
    gratitude.add("Peter")
    result = gratitude.format
    expect(result).to eq "Be grateful for: Mary, Joseph, Peter"
  end
end
