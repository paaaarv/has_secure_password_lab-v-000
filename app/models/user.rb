
gem 'bcrypt'
class User < ActiveRecord::Base

  def password=(password)
    salt = BCrypt::Engine::generate_salt 
    hashed = BCrypt::Engine::hash_secret(password, salt)
    self.password_digest = salt + hashed
  end 

  def authenticate(password)

    salt = password[0..28]
    hashed = BCrypt::Engine::hash_secret(password,salt)
    return nil unless (salt + hashed) == self.password_digest 
  end
  
end
