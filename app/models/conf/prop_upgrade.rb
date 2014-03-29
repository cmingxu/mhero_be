# -*- encoding : utf-8 -*-
module Conf
  class PropUpgrade
    include Mongoid::Document
    field :star_level, type: Integer
    field :sell_price, type: Integer
    field :added_hp, type: Integer
    field :added_atk, type: Integer
    field :added_def, type: Integer
    field :added_speed, type: Integer
    field :added_crit, type: Integer
    field :added_dodge, type: Integer
  end
end
