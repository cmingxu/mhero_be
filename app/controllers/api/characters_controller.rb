# -*- encoding : utf-8 -*-
#

class Api::CharactersController < Api::BaseController

  #吞噬另一个角色。以达到提升等级的效果。
  def swallow_char
  end

  #强化角色。消耗石头和金币。
  def enhance
  end

  #卖掉此角色
  def sold
  end

  #退出队伍
  def remove_from_team
  end

  #变更此角色在队伍的位置
  def update_team_position
  end
  
  #合成英雄。将两个同样星级等级满30的英雄合成另一个更高星级的英雄。使用宝石可以直接提升char01的星级。否则将随即获得一个高星级的英雄。
  def combine
  end
end
