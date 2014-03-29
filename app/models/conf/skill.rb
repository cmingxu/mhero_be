# -*- encoding : utf-8 -*-
module Conf
  class Skill
    include Mongoid::Document

    SKILL_TYPE = %w(单体攻击 atk_mass群体攻击 单体加血 群体加血 单体限制 群体限制 单体辅助 群体辅助)
    ADDITION_EFFECT = %w( atk直接攻击  atk_crit暴击 atk_dec减攻 def_dec减防 speed_dec减速 whirl 眩晕 tied束缚 freeze冰冻 poision中毒 buringing燃烧 blooding出血 fear恐惧 chaos混乱)
    field :name, type: String 
    field :icon, type: String
    field :type, type: String 
    field :colddown_time, type: Integer
    field :skill_range, type: Integer
    field :affect_area, type: Integer
    field :affect_time, type: Integer
    field :affect_target, type: String
    field :addition_effect, type: String
  end
end
