class Admin::UsersController < AdminBaseController
  
  def index
    @users = User.where(activated:true).paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to admin_users_url
  end
end
