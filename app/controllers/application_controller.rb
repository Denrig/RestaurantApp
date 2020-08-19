class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :authorized?

  def check_user(user)
    unless user == current_user
      flash[:danger] = 'You are not allowed to acces that page!'
      redirect_to root_url
    end
  end

  private

  def authorized?
    store_location
    unless logged_in?
      flash[:info] = 'You need to login first.'
      redirect_to login_url
    end
  end
end
