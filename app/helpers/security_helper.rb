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

  # Checks a specific object's atribute maches the token given and the atribute it's not expired
  def authenticated?(object, atribute, token)
    return false if object.nil?

    object_token = object.send("#{atribute}_token")
    token_time = object.send("#{atribute}_created_at")

    return false if object_token.nil? || token_time.nil? || expired?(token_time)

    if object_token == token
      # Reset the token
      create_token!(object, atribute)
      true
    else
      false
    end
  end

  # Updates an object's atribute and atribuite create time with fresh ones
  def create_token!(object, atribute)
    object.update_columns("#{atribute}_token" => new_token, "#{atribute}_created_at" => Time.now)
  end

  # Checks if a time is 'older' then one hour
  def expired?(time)
    time < 1.hour.ago
  end
end
