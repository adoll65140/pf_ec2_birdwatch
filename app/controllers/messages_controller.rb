class MessagesController < ApplicationController
  def create
      if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
        @message = Message.new(message_params)
        @room = @message.room
        if @message.save
          @roommembernotme=Entry.where(room_id: @room.id).where.not(user_id: current_user.id)
            @theid=@roommembernotme.find_by(room_id: @room.id)
            
            redirect_to "/rooms/#{@message.room_id}"
        end
      else
        redirect_back(fallback_location: root_path)
      end
  end
  
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to "/rooms/#{@message.room_id}"
  end

    private 
    def message_params
        params.require(:message).permit(:user_id, :message, :room_id).merge(user_id: current_user.id)
    end
end
