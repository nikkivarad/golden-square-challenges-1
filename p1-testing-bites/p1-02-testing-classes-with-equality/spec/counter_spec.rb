require 'counter'

RSpec.describe Counter do
  it "initialises with 0" do
    counter = Counter.new
    expect(counter.report).to eq 'Counted to 0 so far.'
  end
  
  it "counts to 5 after giving a 5" do
    counter = Counter.new
    counter.add(5)
    result = counter.report
    expect(result).to eq 'Counted to 5 so far.'
  end

  it "counts to 13 after giving a 7 then a 6" do
    counter = Counter.new
    counter.add(7)
    counter.add(6)
    result = counter.report
    expect(result).to eq 'Counted to 13 so far.'
  end
end