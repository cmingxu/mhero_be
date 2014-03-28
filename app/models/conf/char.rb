module Conf
  class Char
    include Mongoid::Document

    CHAR_TYPE = ["STR", "DEX", "INT"]
    CHAR_ATK_TYPE = ["SHORT", "LONG"]

    field :name, type: String
    field :type, type: String
    field :atk_type, type: String
    field :atk_range, type: String
  end
end
