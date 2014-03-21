class User < WorldBase
  include Mongoid::Document
  include Mongoid::Timestamps

  field :nick_name, type: String
  field :last_login_at, type: DateTime, default: -> { Time.now }
  field :level, type: Integer, default: 1
  field :energy, type: Integer, default: 1000
  field :money, type: Integer, default: 10000
  field :gems, type: Integer, default: 10
  field :friend_point, type: Integer, default: 10
  field :char_capacity, type: Integer, default: 3
  field :char_colddown_time, type: Integer, default: 60
  field :pvp_times, type: Integer, default: 10


  embeds_many :characters
  belongs_to :uniq_user

  def self.system_generate_name
    "Player%08d" % User.count
  end

  def generate_characters
    self.char_capacity.times do
      self.characters << Character.new
    end
  end

end
