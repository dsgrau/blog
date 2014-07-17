class User < ActiveRecord::Base
  
  before_save :encrypt_password

  def self.authenticate(email, password_hash)
    user = find_by_email(email)
    if user && user.password_hash == Digest::MD5.digest(password_hash)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    self.password_hash = Digest::MD5.digest(password_hash)
  end

end
