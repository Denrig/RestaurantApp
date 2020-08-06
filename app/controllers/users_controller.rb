class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      Cart.create(user: @user)
      reset_session
      log_in @user
      flash[:succes] = 'Welcome to my restaurant!'
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
