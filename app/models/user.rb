class User < ApplicationRecord
  before_create :create_activation_token

  VALID_NAME_REGEX = /\A[a-zA-Z ]+\z/.freeze

  has_secure_password
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :name, presence: true, length: { minimum: 8, maximum: 50 }, format: { with: VALID_NAME_REGEX }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP  }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # Activates an account.
  def activate
    update(activated: true, activated_at: Time.zone.now, cart: Cart.new)
  end

  # Sends activation email.
  def send_activation_email
    AccountMailer.activation(self).deliver_now
  end

  # Sends reset password mail
  def send_reset_email
    AccountMailer.reset_password(self).deliver_now
  end

  private

  def create_activation_token
    self.activation_token = new_token
    self.activation_created_at = Time.now
  end
end
