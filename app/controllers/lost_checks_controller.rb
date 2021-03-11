class LostChecksController < ApplicationController
  def create
    lost_bird = LostBird.find(params[:lost_bird_id])
    lost_check = current_user.lost_checks.new(lost_bird_id: lost_bird.id)
    lost_check.save
    redirect_to lost_bird_path(lost_bird)
  end

  def destroy
    lost_bird = LostBird.find(params[:lost_bird_id])
    lost_check = current_user.lost_checks.find_by(lost_bird_id: lost_bird.id)
    lost_check.destroy
    redirect_to lost_bird_path(lost_bird)
  end
end
