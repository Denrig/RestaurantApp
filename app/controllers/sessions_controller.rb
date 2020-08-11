class SessionsController < ApplicationController
  skip_before_action :authorize, only: %i[new create]
  def new; end

  def create
    user = User.find_by(email: seession_params[:email])
    if user&.authenticate(seession_params[:password])
      if user.activated?
        foraward_url = session[:forward_url]
        reset_session
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        flash[:success] = "Welcome #{user.name}!"
        redirect_to foraward_url || user
      else
        message = 'Account not activated. '
        message += 'Check your email for the activation link.'
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def seession_params
    params.require(:session).permit(:email, :password)
  end
end
