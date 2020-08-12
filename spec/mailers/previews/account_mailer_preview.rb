# Preview all emails at http://localhost:3000/rails/mailers/account_mailer
class AccountMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/account_mailer/activation
  def activation
    user=User.first
    AccountMailer.activation(user)
  end

  def reset_password
    user=User.first
    AccountMailer.reset_password(user)
  end

end
