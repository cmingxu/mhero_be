# -*- encoding : utf-8 -*-
module Conf
  class CharUpgrade
    include Mongoid::Document

    field :star_level, type: Integer
    field :upgrade_exp_lv01, type: Integer
    field :upgrade_exp_lv30, type: Integer
    field :enhance_stone_cost, type: Integer
    field :enhance_gold_cost, type: Integer
    field :enhance_succ_rate, type: Integer
    field :enhance_fail_points, type: Integer
    field :sell_price, type: Integer
  end
end

