
class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    p user_params
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash.now[:error] = "We could not register you.  Please includer all information, and try again."
      render 'new'
    end
  end

    def show
      p session[:user_id]
      # if logged_in
        @user = User.find(session[:user_id])
      # else
      #   redirect_to "https://www.cnn.com"
      # end
    end

# add other necessary routes if time permitting

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :password)
  end
end
