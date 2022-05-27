require 'cat_facts'

RSpec.describe CatFacts do
  context "using double" do
    it "gets an cat fact from api" do
      requester = double :fake_requester
      expect(requester).to receive(:get).with(URI("https://catfact.ninja/fact")).and_return('{"fact":"The cat\'s clavicle, or collarbone, does not connect with other bones but is buried in the muscles of the shoulder region. This lack of a functioning collarbone allows them to fit through any opening the size of their head.","length":222}')
      catfacts = CatFacts.new(requester)
      expect(catfacts.provide).to eq "Cat fact: The cat's clavicle, or collarbone, does not connect with other bones but is buried in the muscles of the shoulder region. This lack of a functioning collarbone allows them to fit through any opening the size of their head."
    end
  end

  context "using api" do
    xit "gets an cat fact from api" do
      catfacts = CatFacts.new(Net::HTTP)
      expect(catfacts.provide).to eq "Cat fact: XXX"
    end
end
end