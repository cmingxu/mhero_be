class Api::HomeController < Api::BaseController
  def index
    render :json => api_success(user: current_user, :uniq_user => current_user.uniq_user)
  end
end
