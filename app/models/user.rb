class User < ApplicationRecord
  has_one :cart
  has_secure_password

  # Validations
  validates :password, presence: true, length: { minimum: 6 }
  VALID_NAME_REGEX = /\A[a-zA-Z ]+\z/.freeze
  validates :name, presence: true, length: { maximum: 50, minimum: 8 }, format: { with: VALID_NAME_REGEX }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
end
