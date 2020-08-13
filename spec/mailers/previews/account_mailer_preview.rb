class AccountMailerPreview < ActionMailer::Preview
  def activation
    user = User.first
    user.activation_token = User.new_token
    AccountMailer.activation(user)
  end

  def reset_password
    user = User.first
    user.activation_token = User.new_token
    AccountMailer.reset_password(user)
  end
end
