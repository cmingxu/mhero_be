# -*- encoding : utf-8 -*-
class Admin::AccountsController < Admin::BaseController
  def index
    @accounts = Account.page params[:page]
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new account_params
    if @account.save
      redirect_to admin_accounts_path, :notice => "Create Successfully"
    else
      render :action => "new"
    end
  end

  def edit
    @account = Account.find_by :_id => params[:id]
  end


  def update
    @account = Account.find_by :_id => params[:id]
    if @account.update_attributes account_params
      redirect_to edit_admin_account_path(@account)
    else
      render :action => "edit"
    end
  end

  private
  def account_params
    params[:account][:password] = params[:account][:email] if params[:account][:password].blank?
    params.require(:account).permit(:name, :email, :password)
  end
end
