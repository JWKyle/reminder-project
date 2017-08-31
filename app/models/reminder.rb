class Reminder < ApplicationRecord

  validates_presence_of :text, :author_id, :send_at

  belongs_to :author, class_name: "User"

  after_create :reminder_cue

  def reminder_cue
    @twilio_number = ENV['TWILIO_NUMBER']
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    @client = Twilio::REST::Client.new account_sid, ENV['TWILIO_AUTH_TOKEN']
    message = @client.api.account(account_sid).reminder_cues.create(
      :from => @twilio_number,
      :to => self.author.phone,
      :body => self.text,
    )
  end

  def when_to_run
    self.send_at
  end

  handle_asynchronously :reminder_cue, :run_at => Proc.new { |i| i.when_to_run }

end
