class BirdChecksController < ApplicationController
  def create
    bird = Bird.find(params[:bird_id])
    bird_check = current_user.bird_checks.new(bird_id: bird.id)
    bird_check.save
    redirect_to bird_path(bird)
  end

  def destroy
    bird = Bird.find(params[:bird_id])
    bird_check = current_user.bird_checks.find_by(bird_id: bird.id)
    bird_check.destroy
    redirect_to bird_path(bird)
  end
end
