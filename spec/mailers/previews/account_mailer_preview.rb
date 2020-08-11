# Preview all emails at http://localhost:3000/rails/mailers/account_mailer
class AccountMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/account_mailer/activation
  def activation
    AccountMailer.activation
  end

  # Preview this email at http://localhost:3000/rails/mailers/account_mailer/password_reset
  def password_reset
    AccountMailer.password_reset
  end

end
