class AccountManagement::PasswordResetsController < AccountBaseController
  before_action :find_user, :valid_user, only: %i[edit update]

  def new; end

  def edit; end

  def create
    @user = User.find_by(email: params[:password_reset][:email])
    if @user
      create_token!(@user, :reset)
      @user.send_reset_email
      flash[:info] = 'Email send with password reset instructions'
      redirect_to login_url
    else
      flash.now[:danger] = 'Email addres not found'
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      forget(@user)
      reset_session
      log_in @user
      flash[:success] = 'Password has been reset'
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def find_user
    @user = User.find_by(reset_token: params[:id])
  end

  def valid_user
    unless @user&.activated? || authenticated?(@user, :reset, params[:id])
      flash[:danger] = 'Your reset password link is invalid'
      redirect_to login_url
    end
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
