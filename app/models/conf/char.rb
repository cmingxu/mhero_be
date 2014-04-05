# -*- encoding : utf-8 -*-
module Conf
  class Char
    include Mongoid::Document



    CHAR_TYPE = ["STR", "DEX", "INT"]
    CHAR_ATK_TYPE = ["SHORT", "LONG"]

    field :name, type: String
    field :type, type: String
    field :atk_type, type: String
    field :atk_range, type: String
    field :initial_char, type: Boolean
    field :conf_skill_ids, type: Array
    field :conf_prop_ids,  type: Array

    validates :name, :presence => true
    validates :name, :uniqueness => true

    has_and_belongs_to_many :skills, :class_name => "Conf::Skill", :foreign_key => "conf_skill_ids"
    has_and_belongs_to_many :props, :class_name => "Conf::Prop", :foreign_key => "conf_prop_ids"


    def self.random_char_for_user
      CHAR_TYPE.map do |ct|
        self.where(type: ct, initial_char: true).first
      end.compact
    end

  end
end
