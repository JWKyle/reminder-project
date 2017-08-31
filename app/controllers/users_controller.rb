
class UsersController < ApplicationController

  before_action :authentic, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash.now[:error] = "We could not register you.  Please include all information, and try again."
      render 'new', status: 422
    end
  end

  def show
    p "*"*30
      # p session
      # p "$"*50

      # if logged_in?
        @user = User.find(session[:user_id])
        authorized!(@user)
        @reminders = @user.reminders
      # else
      #   redirect_to root_path
      # end
  end

# add other necessary routes if time permitting

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :password)
  end
  #
  # def authentic
  #   p logged_in?
  #   if !logged_in?
  #     p "loop"
  #     # redirect_to root_path
  #     p "i dont know"
  #   end
  # end
end
