class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_room, only: :index

  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room.id)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, images: []).merge(user_id: current_user.id)
  end

  def move_to_room
    num = params[:room_id]
    ids = RoomUser.where(room_id = num).pluck(:user_id)
    redirect_to rooms_path unless ids.include?(current_user.id)
  end
end
