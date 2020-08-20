module SecurityHelper
  # Returns a random token
  def new_token
    SecureRandom.urlsafe_base64
  end
end
