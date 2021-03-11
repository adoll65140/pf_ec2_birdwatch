class BirdCommentsController < ApplicationController
  def create
    bird = Bird.find(params[:bird_id])
    comment = current_user.bird_comments.new(bird_comment_params)
    comment.bird_id = bird.id
    comment.save
    redirect_to bird_path(bird)
  end

  def destroy
    BirdComment.find_by(id: params[:id], bird_id: params[:bird_id]).destroy
    redirect_to bird_path(params[:bird_id])
  end

  private

  def bird_comment_params
    params.require(:bird_comment).permit(:comment)
  end
end
