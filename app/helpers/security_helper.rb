module SecurityHelper
  # Returns a random token
  def new_token
    SecureRandom.urlsafe_base64
  end

  # Returns the hash digest of the given string
  def digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end

  # Check if we know the user already
  def authenticated?(object, atribute, token)
    object_token = object.send("#{atribute}_token")
    token_time = object.send("#{atribute}_created_at")

    return false if digest.nil? || expired?(token_time)

    if object_token == token
      object.send("#{atribute}=", new_token)
      object.send("#{atribute}_created_at=", Time.zone.now)
      true
    else
      false
    end
  end

  def expired?(time)
    time < 1.hour.ago
  end
end
