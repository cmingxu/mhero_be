# -*- encoding : utf-8 -*-
class Character < WorldBase
  include Mongoid::Document

  field :name, type: String
  field :star, type: Integer, default: 0
  field :level, type: Integer, default: 0
  field :cur_exp, type: Integer, default: 0
  field :cur_exp_max, type: Integer, default: 0

  field :team_position, type: Integer
  field :enhance_point, type: Integer

  field :hp, type: Integer, default: 0
  field :atk, type: Integer, default: 0
  field :def, type: Integer, default: 0
  field :speed, type: Integer, default: 0
  field :crit, type: Integer, default: 0
  field :dodge, type: Integer, default: 0

  embedded_in :user
  embeds_many :props

  belongs_to :conf_char, :class_name => "Conf::Char"

  def self.init_by_conf_char(conf_char)
    char = Character.new
    char.conf_char = conf_char
    char.char_type = conf_char.type
    char
  end

  def upgrade_by_exp(exp_point)
  end

  def equip(prop_id)
  end

  def unequip(prop_id)
  end
end
