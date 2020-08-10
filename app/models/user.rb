class User < ApplicationRecord
  has_one :cart
  has_secure_password

  # Validations
  validates :password, presence: true, length: { minimum: 6 }
  VALID_NAME_REGEX = /\A[a-zA-Z ]+\z/.freeze
  validates :name, presence: true, length: { minimum: 8, maximum: 50 }, format: { with: VALID_NAME_REGEX }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP  }, uniqueness: true
end
