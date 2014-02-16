# -*- encoding : utf-8 -*-
#

class Api::AccountsController < Api::BaseController

  def login
    if @account = Account.find_by(name: params[:name])
      if @account.password_valid?(params[:password])
        @account.login_token = SecureRandom.hex(8)
        render :json => api_success(
          :login_token => @account.login_token,
          :account_info => @account.to_api_json
        )
      else
        render :json => api_error(:messages => "password incorrect")
      end
    else
      render :json => api_error(:messages => "account not exists")
    end
  end

  def create
    @account = Account.new account_params
    if @account.save
      render :json => api_success(:id => @account._id.to_s)
    else
      render :json => api_error(:messages => @account.errors.messages.values.flatten)
    end
  end

  private
  def account_params
    params[:account][:password] = params[:account][:email] if params[:account][:password].blank?
    params.require(:account).permit(:name, :email, :password)
  end
end
