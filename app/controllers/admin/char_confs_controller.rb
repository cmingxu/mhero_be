# -*- encoding : utf-8 -*-
class Admin::CharConfsController < Admin::BaseController

  def index
    @char_confs = Conf::Char.all
  end

  def new
    @char_conf = Conf::Char.new
  end

  def create
    @char_conf = Conf::Char.new(char_conf_params)

    if @char_conf.save
      redirect_to admin_char_confs_path, :notice => "create successfully"
    else
      render "new"
    end
  end

  def edit
    @char_conf = Conf::Char.find(params[:id])
  end

  def update
    @char_conf = Conf::Char.find( params[:id])
    if @char_conf.update_attributes char_conf_params
      redirect_to edit_admin_char_conf_path(@char_conf), :notice => "update successfully"
    else
      render "edit"
    end
  end

  def destroy
    @char_conf = Conf::Char.find params[:id]
    if @char_conf.destroy
      redirect_to admin_char_confs_path, :notice => "Deleted"
    else
      redirect_to admin_char_confs_path, :notice => "Failed"
    end
  end

  private
  def char_conf_params
    params.require(:conf_char).permit(:name, :type, :atk_type)
  end
end
