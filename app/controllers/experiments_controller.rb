class ExperimentsController < ApplicationController
  def new
    @experiment = Experiment.new
  end

  def create
    @experiment = Experiment.new(experiment_params)
    if @experiment.save
      redirect_to action: :new
    else
      render :new
    end
  end

  private

  def experiment_params
    params.require(:experiment).permit(:datetime, :weather_id, :temperature, :humidity, :member, :title, :purpose, :method, :condition1, :condition2, :result, :consideration, :note).merge(user_id: current_user.id)
  end
end
