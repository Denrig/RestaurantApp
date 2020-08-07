class UsersController < ApplicationController
  skip_before_action :authorize, only: %i[new create]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in @user
      flash[:sucess]= "Welcome to my page"
      Cart.create(user: @user)
      redirect_to @user
    else
      flash[:danger] = 'Something went wrong!'
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
