class MissionsController < ApplicationController
  before_action :find_mission, only: [:edit, :update, :destroy]

  def index
    @missions = Mission.order(created_at: :desc)
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
  end

  def update
    if @mission.update(mission_params)
      redirect_to root_path, notice: "Mission edited successfully!!!"
    else 
      render :edit
    end
  end

  def destroy
    @mission.destroy if @mission
    redirect_to root_path, notice: "Mission deleted successfully!!!"
  end

  private
  def mission_params
    params.require(:mission).permit(:name, :priority, :status, :start_time, :complete_time)
  end

  def find_mission
    @mission = Mission.find(params[:id])
  end
end
