require 'twilio-ruby'


@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Hello from Ruby",
    to: "number here",    # Replace with your phone number
    from: "+18157343051")  # Replace with your Twilio number

puts message.sid
