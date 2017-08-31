require 'rails_helper'

describe RemindersController do
	let!(:reminder) { Reminder.create!(text: "Wake the eff up", author_id: 1, send_at: (DateTime.now + 5)) }

	describe "GET #index" do
		it "responds with status code 200" do
			get :index
			expect(response).to have_http_status 200
		end

		it "renders the :index template" do
			get :index
			expect(response).to render_template(:index)
		end
	end

	describe "GET #show" do
		it "responds with status code 200" do
			get :show, params: { id: reminder.id }
			expect(response).to have_http_status 200
		end

		it "assigns the correct reminder as @reminder" do
			get :show, params: { id: reminder.id }
			expect(assigns(:reminder)).to eq(reminder)
		end

		it "renders the :show template" do
			get :show, params: { id: reminder.id }
			expect(response).to render_template(:show)
		end
	end

	describe "GET #new" do
		it "responds with status code 200" do
			get :new
			expect(response).to have_http_status 200
		end

		it "assigns a new reminder to @reminder" do
			get :new
			expect(response).to render_template(:new)
		end

		it "renders the :new template" do
			get :new
			expect(response).to render_template(:new)
		end
	end


end
