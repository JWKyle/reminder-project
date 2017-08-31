class SessionsController < ApplicationController

  def new
    @user = User.new
    session[:user_id] = nil
  end

  def create
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}", alert: "Welcome! Time to set some reminders!"
    else
      flash.now[:error] = "We could not log you in.  Please check your e-mail and password, and try again."
      render "new"
      # redirect_to "https://www.google.com"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You have successfully logged out.  You'll hear from us in the future!"
  end
end
