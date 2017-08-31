require 'rails_helper'

describe RemindersController do
	let!(:reminder) { Reminder.create!(text: "Wake the eff up", author_id: 1, send_at: (DateTime.now + 5)) }

	describe "GET #show" do
		it "responds with status code 200" do
			get :show, { id: reminder.id }
			expect(response).to have_http_status 200
		end

		it "assigns the correct reminder as @reminder" do
			get :show, { id: response.id }
			expect(assigns(:reminder)).to eq(reminder)
		end

		it "renders the :show template" do
			get :show, { id: reminder.id }
			expect(response).to render_template(:show)
		end

	end


end
