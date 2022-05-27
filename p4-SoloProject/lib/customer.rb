require 'twilio-ruby'

class Customer
  def initialize
    # takes no parameter
    @menu = [] # array contains all ordered dishes (as dish objects)
     # Storing account sid and token in another place
  end

  def show_dishes
    # takes no argument
    return @menu # return menu, showing names with prices (each dish is an object?)
  end

  def order_meal(dish)
    # takes dish (dish object) as input
    # adds dish into the order(is it an array?)
    # returns nothing
    @menu.push(dish)
  end

  def show_order
    # takes no argument
    # return all ordered meals with price
    output = []
    @menu.each do |dish|
      output << "#{dish.name} - £#{dish.price}"
    end
    return output.join("\n")
  end

  def send_sms(sms_server, time)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = sms_server.new(account_sid, auth_token)
    message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before #{time}",
        to: "+447979994421",    # target phone number
        from: "+19206956770")  # Use this Magic Number for creating SMS

    # puts "\n@client: #{@client}\n@client.messages:#{@client.messages}\nmessage: #{message}\nmessage.sid: #{message.sid}"
    return message
  end

  private


end