class Api::BaseController < ApplicationController
  before_filter :switch_to_right_database

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
end
