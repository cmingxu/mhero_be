# -*- encoding : utf-8 -*-
class Admin::UsersController < Admin::BaseController
  def index
    @users = User.page params[:page]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to admin_users_path, :notice => "Create Successfully"
    else
      render :action => "new"
    end
  end

  def edit
    @user = User.find_by :_id => params[:id]
  end


  def update
    @user = User.find_by :_id => params[:id]
    if @user.update_attributes user_params
      redirect_to edit_admin_user_path(@user)
    else
      render :action => "edit"
    end
  end

  private
  def user_params
    params[:user][:password] = params[:user][:email] if params[:user][:password].blank?
    params.require(:user).permit(:name, :email, :password)
  end
end
