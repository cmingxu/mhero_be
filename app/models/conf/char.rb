# -*- encoding : utf-8 -*-
module Conf
  class Char
    include Mongoid::Document

    attr_accessor :skill_ids

    CHAR_TYPE = ["STR", "DEX", "INT"]
    CHAR_ATK_TYPE = ["SHORT", "LONG"]

    field :name, type: String
    field :type, type: String
    field :atk_type, type: String
    field :atk_range, type: String
    field :initial_char, type: Boolean

    validates :name, :presence => true
    validates :name, :uniqueness => true

    has_and_belongs_to_many :skills, :class_name => "Conf::Skill", inverse_of: nil

    def skill_ids=(skill_ids)
      self.skills = Conf::Skill.find skill_ids
    end
  end
end
