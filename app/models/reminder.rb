require 'twilio-ruby'
class Reminder < ApplicationRecord

  validates_presence_of :text, :author_id, :send_at

  belongs_to :author, class_name: "User"

  after_create :reminder_cue

  # def message_test
  #   @twilio_number = ENV['TWILIO_NUMBER']
  #   auth_token = ENV['TWILIO_AUTH_TOKEN']
  #   account_sid = ENV['TWILIO_ACCOUNT_SID']
  #   @client = Twilio::REST::Client.new account_sid, auth_token
  #   message = @client.api.account.messages.create(
  #       body: self.text,
  #       to: self.phone,    # Replace with your phone number
  #       from: "+18157343051")  # Replace with your Twilio number
  #
  #   puts message.sid
  # end

  def reminder_cue
    @twilio_number = ENV['TWILIO_NUMBER']
    twil_auth_token = ENV['TWILIO_AUTH_TOKEN']
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    @client = Twilio::REST::Client.new(account_sid, twil_auth_token)
    message = @client.messages.create(
        body: self.text,
        to: self.author.phone,    # Replace with your phone number
        from: "+18157343051")  # Replace with your Twilio number
        puts message.sid
    # message = @client.api.account.reminder_cues.create(
    #   :from => @twilio_number,
    #   :to => self.author.phone,
    #   :body => self.text
    # )
  end

  def when_to_run
    self.send_at
  end

  # handle_asynchronously :reminder_cue, :run_at => Proc.new { |i| i.when_to_run }

end
