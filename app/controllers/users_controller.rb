
class UsersController < ApplicationController
  before_action :user_params, only: [:create]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to "/"
    else
      render 'new'
    end
  end

# add other necessary routes if time permitting

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :password)
  end
end
