# -*- encoding : utf-8 -*-
class Api::BaseController < ApplicationController
  before_filter :switch_to_right_database
  before_filter :login_required

  skip_before_filter :verify_authenticity_token

  def api_success(payload)
    default = {}
    default.merge(payload)
  end

  def api_error(payload)
    default = {:success => false}
    default.merge(payload)
  end

  def switch_to_right_database
    WorldBase.switch_to_db "mhero_world3_dev" 
  end

  def login_required
    @uniq_user = UniqUser.find_by(login_token: params[:login_token])
    unless @uniq_user
      render :json => api_error(message: "login failed")
      return false
    end
  end

  def current_user
    @current_user ||= User.find(@uniq_user.current_user_id)
  end
end
