class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :authorized?

  private

  def authorized?
    store_location
    unless logged_in?
      flash[:info] = 'You need to login first.'
      redirect_to login_url
    end
  end
end
