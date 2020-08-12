class AdminBaseController < ApplicationController
  layout 'admin'
  before_action :admin?

  def index
  end

  def admin?
    unless current_user.admin
      flash[:danger] = 'Only privilaged users can acces that page!'
      redirect_to root_url
    end
  end
end
