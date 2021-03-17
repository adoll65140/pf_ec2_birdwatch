class ProtectionBirdCommentsController < ApplicationController
  def create
    protection_bird = ProtectionBird.find(params[:protection_bird_id])
    comment = current_user.protection_bird_comments.new(protection_bird_comment_params)
    comment.protection_bird_id = protection_bird.id
    comment.save
    protection_bird.create_notification_protection_bird_comment!(current_user, comment.id)
    redirect_to protection_bird_path(protection_bird)
  end

  def destroy
    ProtectionBirdComment.find_by(id: params[:id], protection_bird_id: params[:protection_bird_id]).destroy
    redirect_to protection_bird_path(params[:protection_bird_id])
  end

  private

  def protection_bird_comment_params
    params.require(:protection_bird_comment).permit(:comment)
  end
end
