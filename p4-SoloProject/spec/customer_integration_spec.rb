require 'dish'
require 'customer'
require 'text_msg'

RSpec.describe "integration test" do
  context "Local tests" do
    it "show added dishes" do
      customer_1 = Customer.new
      dish_1 = Dish.new("Fish & Chips", 5)
      dish_2 = Dish.new("Yorkshire Pudding", 6)
      customer_1.order_meal(dish_1)
      customer_1.order_meal(dish_2)

      expect(customer_1.show_dishes).to eq [dish_1, dish_2]
    end

    it "shows the order with names and prices" do
      customer_1 = Customer.new
      dish_1 = Dish.new("Fish & Chips", 5)
      dish_2 = Dish.new("Yorkshire Pudding", 6)
      customer_1.order_meal(dish_1)
      customer_1.order_meal(dish_2)

      expect(customer_1.show_order).to eq "Fish & Chips - £5\nYorkshire Pudding - £6"
    end
  end
  context "using api to connect outside web" do
    xit "sends sms" do
      customer_1 = Customer.new
      dish_1 = Dish.new("Fish & Chips", 5)
      dish_2 = Dish.new("Yorkshire Pudding", 6)
      customer_1.order_meal(dish_1)
      customer_1.order_meal(dish_2)

      expect(customer_1.send_sms(Twilio::REST::Client, Time.now)).to eq "SMefc59232961741b282d0497682dc840b"
    end
  end
end