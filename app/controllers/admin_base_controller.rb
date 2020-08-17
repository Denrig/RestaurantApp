class AdminBaseController < ApplicationController
  layout 'admin'
  before_action :admin?

  def admin?
    unless current_user.admin
      flash[:danger] = 'Only privileged users can acces that page!'
      redirect_to root_url
    end
  end
end
