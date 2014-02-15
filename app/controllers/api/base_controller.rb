class Api::BaseController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def api_success(payload)
    default = {}
    default.merge(payload)
  end

  def api_error(payload)
    default = {:success => false}
    default.merge(payload)
  end
end
