require 'customer'
require 'twilio-ruby'

RSpec.describe Customer do
  context "Local unit test" do
    it "initialises" do
      customer_1 = Customer.new
      expect(customer_1).to be
    end

    it "show added dishes" do
      customer_1 = Customer.new
      dish_1 = double :dish
      dish_2 = double :dish
      customer_1.order_meal(dish_1)
      customer_1.order_meal(dish_2)

      expect(customer_1.show_dishes).to eq [dish_1, dish_2]
    end

    it "shows the names and prices of ordered meal" do
      customer_1 = Customer.new
      dish_1 = double :dish
      dish_2 = double :dish
      customer_1.order_meal(dish_1)
      customer_1.order_meal(dish_2)
      expect(dish_1).to receive(:name).and_return("Fish & Chips")
      expect(dish_1).to receive(:price).and_return(5)
      expect(dish_2).to receive(:name).and_return("Yorkshire Pudding")
      expect(dish_2).to receive(:price).and_return(6)

      expect(customer_1.show_order).to eq "Fish & Chips - £5\nYorkshire Pudding - £6"
    end
  end

  context "mocking sms api unit test" do
    it "sends sms to customer" do
      customer_1 = Customer.new
      dish_1 = Dish.new("Fish & Chips", 5)
      dish_2 = Dish.new("Yorkshire Pudding", 6)
      customer_1.order_meal(dish_1)
      customer_1.order_meal(dish_2)

      time = Time.new(2022, 5, 26, 15, 8, 00)

      fake_sms_server = double :sms
      expect(fake_sms_server).to receive(:new).with(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).and_return(fake_sms_server)
      expect(fake_sms_server).to receive(:messages).and_return(fake_sms_server)
      
      expect(fake_sms_server).to receive(:create).with(
        body: "Thank you! Your order was placed and will be delivered before #{time}",
         to: "+447979994421",
         from: "+19206956770"
      ).and_return "SMefc59232961741b282d0497682dc840b"

      result = customer_1.send_sms(fake_sms_server,time)
      expect(result).to eq "SMefc59232961741b282d0497682dc840b"
    end
  end
end

# SMefc59232961741b282d0497682dc840b