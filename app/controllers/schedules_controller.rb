class SchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: :edit

  def index
    @schedules = Schedule.where(user_id: current_user.id)
    @schedule = Schedule.new
  end

  def create
    @schedules = Schedule.where(user_id: current_user.id)
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to action: :index
    else
      render :index
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy
    redirect_to action: :index
  end

  private

  def schedule_params
    params.require(:schedule).permit(:datetime, :plan, :memo, :priority).merge(user_id: current_user.id)
  end

  def move_to_index
    @schedule = Schedule.find(params[:id])
    redirect_to action: :index if current_user.id != @schedule.user_id
  end
end
