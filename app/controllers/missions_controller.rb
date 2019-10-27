class MissionsController < ApplicationController

  def index
    @missions = Mission.all
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(mission_params)
    if @mission.save
      redirect_to root_path, notice: "Mission created successfully!!!"
    else 
      render :new
    end
  end

  def edit
    @mission = Mission.find_by(id: params[:id])
  end

  def update
    @mission = Mission.find_by(id: params[:id])

    if @mission.update(mission_params)
      redirect_to root_path, notice: "Mission edited successfully!!!"
    else 
      render :edit
    end
  end

  def destroy
    @mission = Mission.find_by(id: params[:id])
    @mission.destroy if @mission
    redirect_to root_path, notice: "Mission deleted successfully!!!"
  end

  private
  def mission_params
    params.require(:mission).permit(:name, :priority, :status, :start_time, :complete_time)
  end
end
