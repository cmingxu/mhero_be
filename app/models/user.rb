class User < WorldBase
  field :nick_name, type: String
  field :last_login_at, type: DateTime
  field :level, type: Integer
  field :energy, type: Integer
  field :money, type: Integer
  field :gems, type: Integer
  field :friend_point, type: Integer

  embeds_many :characters


end
