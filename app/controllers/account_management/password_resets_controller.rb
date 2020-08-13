class AccountManagement::PasswordResetsController < AccountBaseController
  before_action :get_user, :valid_user, :check_expiration, only: %i[edit update]

  def new; end

  def edit; end

  def create
    @user = User.find_by(email: params[:password_reset][:email])
    if @user
      @user.create_reset_token
      @user.send_reset_email
      flash[:info] = 'Email send with password reset instructions'
      redirect_to root_url
    else
      flash.now[:danger] = 'Email addres not found'
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      log_out @user
      reset_session
      log_in @user
      flash[:success] = 'Password has reset'
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def get_user
    @user = User.find_by(email: params[:email])
  end

  def valid_user
    unless @user&.activated? && @user&.authenticated?(:reset, params[:id])
      flash[:danger] = 'Your reset password link is invalid'
      redirect_to root_url
    end
  end

  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = 'Password reset has expired.'
      redirect_to new_password_reset_url
    end
  end
end
