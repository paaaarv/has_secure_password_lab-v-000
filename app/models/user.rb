
class User < ActiveRecord::Base
  has_secure_password

  def authenticate(password)
    if self.password_digest == password
      return self
    else
      return false
    end
  end

end
