require 'greet'

RSpec.describe "Greet method should greet with input name" do
  it "When input name as Rex, it greets Rex" do
    expect(greet('Rex')).to eq 'Hello, Rex!'
  end
end