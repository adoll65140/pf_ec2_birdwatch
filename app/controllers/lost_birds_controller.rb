class LostBirdsController < ApplicationController
  def new
    @lost_bird = LostBird.new
  end

  def index
    @lost_birds = LostBird.all
  end

  def edit
    @lost_bird = LostBird.find(params[:id])
  end

  def show
    @lost_bird = LostBird.find(params[:id])
    @lost_bird_comment = LostBirdComment.new
  end

  def create
    @lost_bird = LostBird.new(lost_bird_params)
    @lost_bird.user_id = current_user.id
    @lost_bird.save
    redirect_to lost_birds_path
  end

  def update
    @lost_bird = LostBird.find(params[:id])
    @lost_bird.update(lost_bird_params)
    redirect_to lost_bird_path(@lost_bird.id)
  end

  def destroy
    @lost_bird = LostBird.find(params[:id])
    @lost_bird.destroy
    redirect_to lost_birds_path
  end

  private

  def lost_bird_params
    params.require(:lost_bird).permit(:lost_bird_name, :lost_bird_breed, :lost_bird_age, :feature, :lost_introduction,
                                      :lost_bird_introduction, :bird_image, :bird_icon, :lost_place)
  end
end
