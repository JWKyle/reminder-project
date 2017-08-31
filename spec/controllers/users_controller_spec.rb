require 'rails_helper'
# require 'factory_girl'

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
      post :create, params: {user: { first_name: "Test", last_name: "Tester", email: "test@online.com", phone: 8475309, password: 12345 }}
      expect(response).to have_http_status 302
    end

    it "assigns a new user to @user" do
      post :create, params: {user: { first_name: "Test", last_name: "Tester", email: "test@online.com", phone: 8475309, password: 12345 }}
      expect(assigns(:user)).to be_a_kind_of User
    end

    it "renders the :show template" do
      post :create, params: {user: { first_name: "Test", last_name: "Tester", email: "test@online.com", phone: 8475309, password: 12345 }}
      expect(response).to redirect_to assigns(:user)
    end
  end

  context "when invalid params are passed" do
    it "responds with status code 422: Unprocessable Entity" do
      post :create, params: {user: { first_name: "", last_name: "Tester", email: "", phone: 8475309, password: "" }}
      expect(response).to have_http_status 422
    end

    it "does not create a new game in the database" do
      expect { post :create, params: {user: { first_name: "", last_name: "Tester", email: "", phone: 8475309, password: "" }}}.to_not change(User, :count)
    end

    it "assigns the unsaved user as @user" do
      post :create, params: {user: { first_name: "", last_name: "Tester", email: "", phone: 8475309, password: "" }}
      expect(assigns(:user)).to be_a(User)
    end

    it "renders the :new template" do
      post :create, params: {user: { first_name: "", last_name: "Tester", email: "", phone: 8475309, password: "" }}
      expect(response).to render_template(:new)
    end
  end

  context "#show" do
    let!(:user) { User.create!(first_name: "Test", last_name: "Tester", email: "test@online.com", phone: 8475309, password: "12345") }

    describe "GET #show" do
      it "responds with status code 200" do
        session[:user_id] = user.id
        get :show, params: {id: session.id}
        expect(response).to have_http_status 200
      end

      it "assigns a show user to @user" do
        session[:user_id] = user.id
        get :show, params: {id: session.id}
        expect(assigns(:user)).to be_a User
      end

      it "renders the :show template" do
        session[:user_id] = user.id
        get :show, params: {id: session.id}
        expect(response).to render_template(:show)
      end
    end
  end
end
