class User < WorldBase
  include Mongoid::Document
  include Mongoid::Timestamps

  field :nick_name, type: String
  field :last_login_at, type: DateTime
  field :level, type: Integer
  field :energy, type: Integer
  field :money, type: Integer
  field :gems, type: Integer
  field :friend_point, type: Integer
  field :char_capacity, type: Integer
  field :char_colddown_time, type: Integer
  field :pvp_times, type: Integer

  embeds_many :characters


end
