class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to action: :index
    else
      render :index
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
