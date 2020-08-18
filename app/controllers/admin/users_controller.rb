class Admin::UsersController < AdminBaseController
  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def destroy
    flash[:success] = 'User deleted' if User.find(params[:id]).destroy
    redirect_to admin_users_url
  end
end
