# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController
  def new
    @moderator = Moderator.new :name => "admin@admin.com"
  end

  def create
    @moderator = Moderator.find_by(:name => params[:login]) || Moderator.find_by(:email => params[:login])
    if @moderator && @moderator.password_valid?(params[:password])
      session[:uid] = @moderator._id
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
