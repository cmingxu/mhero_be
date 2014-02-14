# -*- encoding : utf-8 -*-
class Moderator
  include Mongoid::Document
  include Mongoid::Timestamps
 

  field :email, type: String
  field :encrypted_password, type: String
  field :salt, type: String
  field :last_login_at, type: DateTime
  field :last_login_ip, type: String


  def password=(password)
    self.salt = SecureRandom.hex(10) 
    self.encrypted_password = encrypt_password(password)
  end

  def password_valid?(password)
    self.encrypted_password == encrypt_password(password)
  end

  def encrypt_password(password)
    Digest::SHA1.hexdigest(password + self.salt)
  end
end
