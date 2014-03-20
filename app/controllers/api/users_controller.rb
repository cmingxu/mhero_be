# -*- encoding : utf-8 -*-
#

class Api::UsersController < Api::BaseController

  def login
    if @user = User.find_by(name: params[:name])
      if @user.password_valid?(params[:password])
        @user.login_token = SecureRandom.hex(8)
        render :json => api_success(
          :login_token => @user.login_token,
          :user_info => @user.to_api_json
        )
      else
        render :json => api_error(:messages => "password incorrect")
      end
    else
      render :json => api_error(:messages => "user not exists")
    end
  end

  def create
    @user = user.new user_params
    if @user.save
      render :json => api_success(:id => @user._id.to_s)
    else
      render :json => api_error(:messages => @user.errors.messages.values.flatten)
    end
  end

  private
  def user_params
    params[:user][:password] = params[:user][:email] if params[:user][:password].blank?
    params.require(:user).permit(:name, :email, :password)
  end
end
