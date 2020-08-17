class AccountMailer < ApplicationMailer
  def activation(user)
    @user = user
    mail to: user.email, subject: 'Activation'
  end

  def reset_password(user)
    @user = user
    mail to: user.email, subject: 'Password reset'
  end
end
