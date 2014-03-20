# -*- encoding : utf-8 -*-
class Admin::WorldsController < Admin::BaseController
  def index
    @worlds = Wrold.page params[:page]
  end

  def new
    @world = World.new
  end

  def create
  end

  def edit
    @world = World.find_by :_id => params[:id]
  end


  def update
    @world = World.find_by :_id => params[:id]
    if @world.update_attributes world_params
      redirect_to edit_admin_world_path(@world)
    else
      render :action => "edit"
    end
  end

  private
  def world_params
    params.require(:world).permit(:name, :email, :password)
  end
end
