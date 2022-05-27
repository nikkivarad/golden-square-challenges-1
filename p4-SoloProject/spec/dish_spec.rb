require 'dish'

RSpec.describe Dish do
  it "initialises" do
    dish_1 = Dish.new("Fish & Chips", 5)
    expect(dish_1.name).to eq "Fish & Chips"
    expect(dish_1.price).to eq 5
  end
end