require 'add_five'

RSpec.describe "add_five method" do
  it "adds 5 to 4 to return 9" do
    result = add_five(4)
    expect(result).to eq 9
  end
end