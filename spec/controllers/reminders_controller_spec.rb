require 'rails_helper'

describe RemindersController do
	let!(:reminder) { Reminder.create!(text: "Wake the eff up", author_id: 1, send_at: (DateTime.now + 5)) }

	describe "GET #show" do 
		it "responds with status code 200" do
			get :show, { id: reminder.id }
			expect(response).to have_http_status 200
		end
	end


end