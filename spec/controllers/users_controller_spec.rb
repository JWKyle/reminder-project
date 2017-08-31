require 'rails_helper'
# require 'factory_girl'

describe UsersController do
  # let!(:user) { User.create!(first_name: "Test", last_name: "Tester", email: "test@online.com", phone: 8475309, password: "12345") }
  describe "GET #new" do
    it "responds with status code 200" do
      get :new
      expect(response).to have_http_status 200
    end

    it "assigns a new user to @user" do
      get :new
      expect(assigns(:user)).to be_a_new User
    end

    it "renders the :show template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "post #create" do
    it "responds with status code 302" do
      # user_params = FactoryGirl.attributes_for(:user)
      # post :create, { user => user_params}
      post :create, user: { first_name: "Test", last_name: "Tester", email: "test@online.com", phone: 8475309, password: 12345 }
      expect(response).to have_http_status 302
    end

    it "assigns a new user to @user" do
      post 'sessions/create', user: { first_name: "Test", last_name: "Tester", email: "test@online.com", phone: 8475309, password: 12345 }
      expect(assigns(:user)).to be_a_new User
    end

    # it "renders the :show template" do
    #   get :new
    #   expect(response).to render_template(:new)
    # end
  end
end
