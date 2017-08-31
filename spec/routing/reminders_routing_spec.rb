require "rails_helper"

RSpec.describe "Routing to reminders", :type => :routing do
  it "routes GET /reminders to reminders#index" do
    expect(:get => "/reminders").to route_to("reminders#index")
  end

  it "routes GET /reminders/new to reminders#new" do
    expect(:get => "/reminders/new").to route_to("reminders#new")
  end

  it "routes GET /reminders/1 to reminders#show" do
    expect(:get => "/reminders/1").to route_to("reminders#show", :id => "1")
  end

  it "routes POST /reminders to reminders#create" do
    expect(:post => "/reminders").to route_to("reminders#create")
  end

  it "routes DELETE /reminders/1 to reminders#destroy" do
    expect(:delete => "/reminders/1").to route_to("reminders#destroy", :id => "1")
  end
end