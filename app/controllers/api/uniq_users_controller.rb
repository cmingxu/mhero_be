# -*- encoding : utf-8 -*-
#
class Api::UniqUsersController < Api::BaseController
  skip_before_filter :login_required, :only => [:login, :create]

  def login
    if @uniq_user = UniqUser.find_by(name: params[:name])
      if @uniq_user.password_valid?(params[:password])
        @uniq_user.login_token = SecureRandom.hex(8)
        @uniq_user.save
        render :json => api_success(
          :login_token => @uniq_user.login_token,
          :uniq_user_info => @uniq_user.to_api_json
        )
      else
        render :json => api_error(:messages => "password incorrect")
      end
    else
      render :json => api_error(:messages => "uniq_user not exists")
    end
  end

  def create
    @uniq_user = UniqUser.new uniq_user_params
    @user = @uniq_user.generate_user
    @user.generate_characters
    if @uniq_user.save && @user.save
      render :json => api_success(:id => @uniq_user._id.to_s, :user => @user)
    else
      render :json => api_error(:messages => @uniq_user.errors.messages.values.flatten)
    end
  end

  private
  def uniq_user_params
    params[:uniq_user][:password] = params[:uniq_user][:email] if params[:uniq_user][:password].blank?
    params.require(:uniq_user).permit(:name, :email, :password)
  end
end

