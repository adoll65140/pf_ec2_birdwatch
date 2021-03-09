class BirdsController < ApplicationController
  def index
    @birds = Bird.all
  end

  def edit
    @bird =Bird.find(params[:id])
  end
  
  def update
    @bird = Bird.find(params[:id])
    @bird.update(bird_params)
    redirect_to bird_path(@bird.id)  
  end

  def show
    @bird =Bird.find(params[:id])
  end

  def new
    @bird = Bird.new
  end
  
  def create
    @bird = Bird.new(bird_params)
    @bird.user_id = current_user.id
    @bird.save
    redirect_to birds_path  
  end
  
  def destroy
    @bird = Bird.find(params[:id])
    @bird.destroy
    redirect_to birds_path
  end
  
  private

  def bird_params
    params.require(:bird).permit(:bird_name, :breed, :bird_age, :bird_introduction, :bird_back_image, :bird_icon)
  end
  
end