# -*- encoding : utf-8 -*-
class UniqUser < GlobalBase
  include Mongoid::Document
  include Mongoid::Timestamps

  attr_accessor :password

  field :email, type: String
  field :name, type: String
  field :encrypted_password, type: String
  field :salt, type: String
  field :last_login_at, type: DateTime
  field :last_login_ip, type: String
  field :login_token, type: String

  embeds_many :device_infos
  has_many :users

  validates :email, :uniqueness => true, :allow_nil => true
  validates :email, :format => { :with => Constants::EMAIL_REGEXP }, :allow_blank => true

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

  def to_api_json
    {
      :name => self.name,
      :email => self.email
    }
  end
end
