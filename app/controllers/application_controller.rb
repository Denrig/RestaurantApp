class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :authorize

  private

  def authorize
    store_location
    unless logged_in?
      flash[:info] = 'You need to login first.'
      redirect_to login_url
    end
  end

  
end
