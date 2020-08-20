class AccountManagement::AccountActivationsController < AccountBaseController

  def edit
    user = User.find_by(activation_token: params[:id])
    if user && !user.activated? && authenticated?(user, :activation, params[:id])
      user.activate
      log_in user
      flash[:success] = 'Account activated!'
      redirect_to user
    else
      flash[:danger] = 'Invalid activation link!'
      redirect_to root_url
    end
  end
end
