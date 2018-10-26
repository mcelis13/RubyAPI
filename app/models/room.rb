class Room < ApplicationRecord
  def create
    @room = Room.create(room_params)
    if @room.valid?
      render json: { room.RoomSerializer.new(@room)}, status: :created
    else
      render json: { error: 'failed to create room'}, status: :not_acceptable
    end
  end

  def destroy
    @room = Room.find_by(params[:id])
    @room.destroy
  end

  def update
    if @room.update(room_params)
      render json: @room
    else
      render json: {@room.errors}, status: :unprocessable_entity
    end
  end

  private
  def room_params
    params.require(:room).permit(:publisher_id, :subscriber_id)
  end
end
