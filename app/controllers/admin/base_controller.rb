# -*- encoding : utf-8 -*-
class Admin::BaseController < ApplicationController
  layout "admin"

  helper_method :current_user
  before_filter :login_required

  def current_user
    @account = Moderator.find_by(_id: session[:uid] || "")
  end

  def login_required
    unless current_user
      session[:redirect_to] = request.path
      redirect_to new_sessions_path, :notice => "Login Required"
    end
  end
end
