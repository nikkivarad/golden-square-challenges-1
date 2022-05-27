require 'twilio-ruby'

account_sid = ENV['TWILIO_ACCOUNT_SID'] # Your Test Account SID from www.twilio.com/console/settings
auth_token = ENV['TWILIO_AUTH_TOKEN']   # Your Test Auth Token from www.twilio.com/console/settings

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Hello from Ruby",
    to: "+447979994421",    # Replace with your phone number
    from: "+19206956770")  # Use this Magic Number for creating SMS

puts message.sid
