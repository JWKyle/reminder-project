class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token

  def message
    response = Twilio::TwiML::Response.new do |r|
      r.Sms "Well done building your first Twilio on Rails 5 app!"
    end
    render :xml => response.to_xml
  end
end