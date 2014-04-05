# -*- encoding : utf-8 -*-
class Admin::CharUpgradeConfsController < Admin::BaseController

  def index
    @char_confs = Conf::CharUpgrade.all
  end

  def new
    @char_conf = Conf::CharUpgrade.new
  end

  def create
    @char_conf = Conf::CharUpgrade.new(char_conf_params)

    if @char_conf.save
      redirect_to admin_char_confs_path, :notice => "create successfully"
    else
      render "new"
    end
  end

  def edit
    @char_conf = Conf::CharUpgrade.find(params[:id])
  end

  def update
    @char_conf = Conf::CharUpgrade.find( params[:id])
    if @char_conf.update_attributes char_conf_params
      redirect_to edit_admin_char_conf_path(@char_conf), :notice => "update successfully"
    else
      render "edit"
    end
  end

  def destroy
    @char_conf = Conf::CharUpgrade.find params[:id]
    if @char_conf.destroy
      redirect_to admin_char_confs_path, :notice => "Deleted"
    else
      redirect_to admin_char_confs_path, :notice => "Failed"
    end
  end

  private
  def char_conf_params
    params.require(:conf_char_upgrade).permit(:star_level, :upgrade_exp_lv01, :upgrade_exp_lv30, :enhance_stone_cost, :enhance_gold_cost, :enhance_succ_rate, :enhance_fail_points, :sell_price)
  end
end
