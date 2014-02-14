# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController
  def new
    @account = Account.new :name => "admin@admin.com"
  end

  def create
    @account = Account.find_by(:name => params[:login]) || Account.find_by(:email => params[:login])
    if @account && @account.password_valid?(params[:password])
      session[:uid] = @account._id
      redirect_to admin_path, :notice => "Welcome back!"
    else
      render :new
    end
  end

  def destroy
    session[:uid] = nil
    redirect_to root_path, :notice => "Bye"
  end
end
