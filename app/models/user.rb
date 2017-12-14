
gem 'bcrypt'
class User < ActiveRecord::Base
  has_secure_password

  def password=(password)
    salt = BCrypt::Engine::generate_salt
    hashed = BCrypt::Engine::hash_secret(password,salt)
    self.password_digest == (salt,hashed)
  end

  def authenticate(password)

    salt = password[0..28]
    hashed = BCrypt::Engine::hash_secret(password, salt)
    if self.password_digest == (salt + hashed)
      return self
    else
      return false
    end
  end

end
