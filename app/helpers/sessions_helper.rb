module SessionsHelper
  # Stores the forward url if the request has get method
  def store_location
    session[:forward_url] = request.original_url if request.get?
  end

  def log_in(user)
    session[:user_id] = user.id
    user.update!(active: true)
  end

  # Remembers a persistent session
  def remember(user)
    create_token!(user, :remember)
    cookies.permanent.encrypted[:user_id] = user.id
    cookies.permanent.encrypted[:remember_token] = user.remember_token
  end

  def log_out
    reset_session
    forget(@current_user)
    @current_user.update(active: false)
    @current_user = nil
  end

  # Forgets a persistent session
  def forget(user)
    create_token!(user, :remember)
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Returns the user corresponding to the remember token cookie.
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.encrypted[:user_id])
      user = User.find_by(id: user_id)
      if user && authenticated?(user, :remember, cookies.encrypted[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def logged_in?
    !current_user.nil?
  end
end
