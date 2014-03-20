# -*- encoding : utf-8 -*-
class Admin::UniqUsersController < Admin::BaseController
  def index
    @uniq_users = UniqUser.page params[:page]
  end

  def new
    @uniq_user = UniqUser.new
  end

  def create
    @uniq_user = UniqUser.new uniq_user_params
    if @uniq_user.save
      redirect_to admin_uniq_users_path, :notice => "Create Successfully"
    else
      render :action => "new"
    end
  end

  def edit
    @uniq_user = UniqUser.find_by :_id => params[:id]
  end


  def update
    @uniq_user = UniqUser.find_by :_id => params[:id]
    if @uniq_user.update_attributes uniq_user_params
      redirect_to edit_admin_uniq_user_path(@uniq_user)
    else
      render :action => "edit"
    end
  end

  private
  def uniq_user_params
    params[:uniq_user][:password] = params[:uniq_user][:email] if params[:uniq_user][:password].blank?
    params.require(:uniq_user).permit(:name, :email, :password)
  end
end
