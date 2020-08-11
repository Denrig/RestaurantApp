class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :authorize

  private

  def authorize
    store_location
    redirect_to login_url unless logged_in?
  end
end
