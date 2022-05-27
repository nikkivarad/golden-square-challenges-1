require 'check_codeword'

RSpec.describe "check_codeword method" do
  it "refuses entry to a wrong password" do
    expect(check_codeword('password')).to eq 'WRONG!'
  end
  it "hinted when a close password" do
    expect(check_codeword('hamme')).to eq "Close, but nope."
  end
  it "allows entry if password is correct" do
    expect(check_codeword("horse")).to eq "Correct! Come in."
  end  
end