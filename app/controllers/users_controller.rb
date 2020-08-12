class UsersController < ApplicationController
  before_action :correct_user, only: %i[edit update]
  before_action :admin?, only: %i[index destroy]

  skip_before_action :authorize, only: %i[new create]


  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_url and return unless @user.activated?
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_mail
      flash[:info]="Please check your email to activate your account"
      redirect_to login_url
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Profile updated!'
      redirect_to @user
    else
      render :edit
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless @user == current_user
  end
end
