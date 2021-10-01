class SchedulesController < ApplicationController

  def index
    @schedules = Schedule.all
    @schedule = Schedule.new
  end

  def create
    @schedules = Schedule.all
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to action: :index
    else
      render :index
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:datetime, :plan, :memo).merge(user_id: current_user.id)
  end
  
end
