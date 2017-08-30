require 'rails_helper'

describe UsersController do
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
      post :create, { user: { first_name: "Test", last_name: "Tester", email: "test@online.com", phone: 8475309, password: 12345 } }
      expect(response).to have_http_status 302
    end

    # it "assigns a new user to @user" do
    #   get :new
    #   expect(assigns(:user)).to be_a_new User
    # end
    #
    # it "renders the :show template" do
    #   get :new
    #   expect(response).to render_template(:new)
    # end
  end
end
