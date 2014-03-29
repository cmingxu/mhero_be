# -*- encoding : utf-8 -*-
class Admin::PropConfsController < Admin::BaseController

  def index
    @conf_props = Conf::Prop.all
  end

  def new
    @conf_prop = Conf::Prop.new
  end

  def create
    @conf_prop = Conf::Prop.new(conf_prop_params)

    if @conf_prop.save
      redirect_to admin_prop_confs_path, :notice => "create successfully"
    else
      render "new"
    end
  end

  def edit
    @conf_prop = Conf::Prop.find(params[:id])
  end

  def update
    @conf_prop = Conf::Prop.find( params[:id])
    if @conf_prop.update_attributes conf_prop_params
      redirect_to edit_admin_prop_conf_path(@conf_prop), :notice => "update successfully"
    else
      render "edit"
    end
  end

  def destroy
    @conf_prop = Conf::Prop.find params[:id]
    if @conf_prop.destroy
      redirect_to admin_prop_confs_path, :notice => "Deleted"
    else
      redirect_to admin_prop_confs_path, :notice => "Failed"
    end
  end

  private
  def conf_prop_params
    params.require(:conf_prop).permit(:name, :type)
  end
end
