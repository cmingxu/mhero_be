# -*- encoding : utf-8 -*-
class Admin::SkillConfsController < Admin::BaseController

  def index
    @conf_skills = Conf::Skill.all
  end

  def new
    @conf_skill = Conf::Skill.new
  end

  def create
    @conf_skill = Conf::Skill.new(conf_skill_params)

    if @conf_skill.save
      redirect_to admin_skill_confs_path, :notice => "create successfully"
    else
      render "new"
    end
  end

  def edit
    @conf_skill = Conf::Skill.find(params[:id])
  end

  def update
    @conf_skill = Conf::Skill.find( params[:id])
    if @conf_skill.update_attributes conf_skill_params
      redirect_to edit_admin_skill_conf_path(@conf_skill), :notice => "update successfully"
    else
      render "edit"
    end
  end

  def destroy
    @conf_skill = Conf::Skill.find params[:id]
    if @conf_skill.destroy
      redirect_to admin_skill_confs_path, :notice => "Deleted"
    else
      redirect_to admin_skill_confs_path, :notice => "Failed"
    end
  end

  private
  def conf_skill_params
    params.require(:conf_skill).permit(:name, :icon, :type, :colddown_time, :skill_range, :affect_area, :affect_target, :affect_time, :addition_effect)
  end
end

