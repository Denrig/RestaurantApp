# Preview all emails at http://localhost:3000/rails/mailers/account_mailer
class AccountMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/account_mailer/activation
  def activation
    user=User.find_by(email: 'bogdanboer@yahoo.com')
    AccountMailer.activation(user)
  end

end
