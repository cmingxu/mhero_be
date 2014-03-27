# -*- encoding : utf-8 -*-
class Admin::CharConfsController < Admin::BaseController

  def index
    @char_confs = Conf::Char.all
  end
end
