require 'report_length'

RSpec.describe 'report_length method' do
  it "reports the length of the input string" do
    expect(report_length('abc')).to eq "This string was 3 characters long."
    expect(report_length('This is a test')).to eq "This string was 14 characters long."
  end
end