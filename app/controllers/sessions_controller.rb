class SessionsController < ApplicationController
  skip_before_action :authorize, only: %i[new create]
  def new; end

  def create
    user = User.find_by(email: seession_params[:email])
    if user&.authenticate(seession_params[:password])
      reset_session
      log_in user
      flash[:success] = "Welcone #{user.name}!"
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def seession_params
    params.require(:session).permit(:email, :password)
  end
end
