class ExperimentsController < ApplicationController
  def index
    @experiments = Experiment.order(datetime: 'DESC')
  end

  def new
    @experiment = Experiment.new
  end

  def create
    @experiment = Experiment.new(experiment_params)
    if @experiment.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
    @experiment = Experiment.find(params[:id])
  end

  def update
    @experiment = Experiment.find(params[:id])
    if @experiment.update(experiment_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    experiment = Experiment.find(params[:id])
    experiment.destroy
    redirect_to action: :index
  end

  private

  def experiment_params
    params.require(:experiment).permit(:datetime, :weather_id, :temperature, :humidity, :member, :title, :purpose, :method,
                                       :condition1, :condition2, :result, :consideration, :note).merge(user_id: current_user.id)
  end
end
