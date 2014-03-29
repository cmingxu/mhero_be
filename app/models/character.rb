# -*- encoding : utf-8 -*-
class Character < WorldBase
  include Mongoid::Document

  field :char_template_id, type: Integer
  field :char_type, type: Integer
  field :name, type: String
  field :star, type: Integer
  field :level, type: Integer
  field :cur_exp, type: Integer
  field :cur_exp_max, type: Integer

  field :team_position, type: Integer
  field :enhance_point, type: Integer

  field :hp, type: Integer
  field :atk, type: Integer
  field :def, type: Integer
  field :speed, type: Integer
  field :crit, type: Integer
  field :dodge, type: Integer

  embedded_in :user
  embeds_many :props

  def upgrade_by_exp(exp_point)
  end

  def equip(prop_id)
  end

  def unequip(prop_id)
  end
end
