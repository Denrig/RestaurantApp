class User < ApplicationRecord
  has_one :cart
  has_secure_password
  attr_accessor :remember_token

  # Validations
  VALID_NAME_REGEX = /\A[a-zA-Z ]+\z/.freeze
  validates :name, presence: true, length: { minimum: 8, maximum: 50 }, format: { with: VALID_NAME_REGEX }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP  }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  class << self
    # Returns the hash digest of the given string
    def digest(string)
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  # Saves the token in the database
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Deletes token from database
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Check if we know the user already
  def authenticated?(remember_token)
    return false if remember_digest.nil?

    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
