class SchedulesController < ApplicationController

  def index
    @schedules = Schedule.all
    @schedule = Schedule.new
  end

  def create
    Schedule.create(schedule_params)
    redirect_to action: :index
  end

  private

  def schedule_params
    params.require(:schedule).permit(:datetime, :plan, :memo).merge(user_id: current_user.id)
  end
  
end
