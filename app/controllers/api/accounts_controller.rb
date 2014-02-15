# -*- encoding : utf-8 -*-
#

class Api::AccountsController < Api::BaseController


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
