# -*- encoding : utf-8 -*-
class Admin::PropConfsController < Admin::BaseController

  def index
    @prop_confs = Conf::Prop.all
  end
end
