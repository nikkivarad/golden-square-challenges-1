require 'string_builder'

RSpec.describe StringBuilder do
  it "initializes with an empty string, 0 characters" do
    stringbuilder = StringBuilder.new
    expect(stringbuilder.size).to eq 0
    expect(stringbuilder.output).to eq ""
  end

  it "counts the string 'hello' as 5 chars long, and returns 'hello'." do
    stringbuilder = StringBuilder.new
    stringbuilder.add("hello")
    expect(stringbuilder.size).to eq 5
    expect(stringbuilder.output).to eq "hello"
  end

  it "adds two strings 'hello' and 'world', and counts 10 chars." do
    stringbuilder = StringBuilder.new
    stringbuilder.add("hello")
    stringbuilder.add("world")
    expect(stringbuilder.size).to eq 10
    expect(stringbuilder.output).to eq "helloworld"
  end
end