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

	describe "POST #create" do
		context "when valid params are passed" do
			it "responds with status code 302" do
        post :create, params: { reminder: { text: "Wash dog", author_id: 1, send_at: DateTime.now } }
        expect(response).to have_http_status 302
      end

			it "creates a new reminder in the database" do
				expect { post(:create, params: { reminder: { text: "Wash dog", author_id: 1, send_at: DateTime.now } } ) }.to change(Reminder, :count).by(1)
			end

			it "assigns the newly created reminder as @reminder" do
        post :create, params: { reminder: { text: "Wash dog", author_id: 1, send_at: DateTime.now } }
        expect(assigns(:reminder)).to be_a(reminder)
      end

      it "sets a notice that the reminder was successfully created" do
        post :create, params: { reminder: { text: "Wash dog", author_id: 1, send_at: DateTime.now } }
        expect(flash[:notice]).to match /reminder was successfully created/
      end

      it "redirects to the created reminder" do
        post :create, params: { reminder: { text: "Wash dog", author_id: 1, send_at: DateTime.now } }
        expect(response).to redirect_to assigns(:reminder)
      end
		end

		context "when invalid params are passed" do
      it "renders a flash notice 'reminder failed.'" do
        post :create, params: { reminder: { text: nil, author_id: nil, send_at: DateTime.now } }
        expect(flash[:notice]).to match "reminder failed."
      end

      it "does not create a new reminder in the database" do
        expect { post(:create, params: { reminder: { text: nil, author_id: nil, send_at: DateTime.now } } ) }.to_not change(reminder, :count)
      end

      it "assigns the unsaved reminder as @reminder" do
        post :create, params: { reminder: { text: nil, author_id: nil, send_at: DateTime.now } }
        expect(assigns(:reminder)).to be_a(reminder)
      end

      it "renders the :new template" do
        post :create, params: { reminder: { text: nil, author_id: nil, send_at: DateTime.now } }
        expect(response).to render_template(:new)
      end
    end
	end




end
