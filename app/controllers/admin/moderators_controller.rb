# -*- encoding : utf-8 -*-
class Admin::ModeratorsController < Admin::BaseController
  def index
    @moderators = Moderator.page params[:page]
  end

end
