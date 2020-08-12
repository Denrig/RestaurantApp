class AccountMailer < ApplicationMailer
  default from: "from@example.com"

  layout "mailer"
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.account_mailer.activation.subject
  #
  def activation(user)
    @user = user
    mail to: user.email, subject: 'Activation'
  end

  def reset_password(user)
    @user = user
    mail to: user.email, subject: 'Password reset'
  end
end
