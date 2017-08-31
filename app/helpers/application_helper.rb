require 'byebug'

module ApplicationHelper
  def current_user
    current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    session[:user_id] != nil
  end

  def authentic
    redirect_to root_path unless logged_in?
  end

  def authorized!(user)
    redirect_to root_path unless authorized?(user)
  end

  def authorized?(user)
    current_user == user
  end
end
