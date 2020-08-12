class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :authorize

  private

  def authorize
    flash[:info]='You need to login first.'
    store_location
    redirect_to login_url unless logged_in?
  end

  def admin?
    unless current_user.admin
      flash[:danger] = 'Only privilaged users can acces that page!'
      redirect_to root_url
    end
  end
end
