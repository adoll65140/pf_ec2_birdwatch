class LostBirdCommentsController < ApplicationController
  def create
    lost_bird = LostBird.find(params[:lost_bird_id])
    comment = current_user.lost_bird_comments.new(lost_bird_comment_params)
    comment.lost_bird_id = lost_bird.id
    comment.save
    redirect_to lost_bird_path(lost_bird)  
  end

  def destroy
    LostBirdComment.find_by(id: params[:id], lost_bird_id: params[:lost_bird_id]).destroy
    redirect_to lost_bird_path(params[:lost_bird_id])  
  end

  private

  def lost_bird_comment_params
    params.require(:lost_bird_comment).permit(:comment)
  end
end
