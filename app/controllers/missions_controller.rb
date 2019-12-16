class MissionsController < ApplicationController
  before_action :find_mission, only: [:edit, :update, :destroy]
  before_action :find_mission_ransack, only: [:index]

  def index
    @missions = @q.result.order_by_complete_time
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(mission_params)
    if @mission.save
      redirect_to root_path, notice: t(".notice")
    else 
      render :new
    end
  end

  def edit
  end

  def update
    if @mission.update(mission_params)
      redirect_to root_path, notice: t(".notice")
    else 
      render :edit
    end
  end

  def destroy
    @mission.destroy if @mission
    redirect_to root_path, notice: t(".notice")
  end

  private
  def mission_params
    params.require(:mission).permit(:name, :priority, :status, :start_time, :complete_time, :description)
  end

  def find_mission
    @mission = Mission.find(params[:id])
  end

  def find_mission_ransack
    @q = Mission.ransack(params[:q])
  end
end
