class BirdsController < ApplicationController

  def edit
    @bird =Bird.find(params[:id])
    if @bird.user == current_user
      render "edit"
    else
      redirect_to birds_path
    end
  end

  def index
   @birds =Bird.all
  end

  def update
    @bird = Bird.find(params[:id])
    if @bird.update(bird_params)
       flash[:notice] = '変更しました'
    redirect_to bird_path(@bird.id)
    else
      flash.now[:alert] = "内容をお確かめください"
      render :edit
    end
  end

  def show
    @bird =Bird.find(params[:id])
    @bird_comment = BirdComment.new
  end

  def new
    @bird = Bird.new
  end

  def create
    @bird = Bird.new(bird_params)
    @bird.user_id = current_user.id
    if @bird.save
      flash[:notice] = '登録しました'
      redirect_to bird_path(@bird.id)
    else
      flash.now[:alert] = "内容をお確かめください"
      render :new
    end
  end

  def destroy
    @bird = Bird.find(params[:id])
    @bird.destroy
    redirect_to birds_path
  end

  private

  def bird_params
    params.require(:bird).permit(:bird_name, :bird_age, :bird_introduction, :bird_back_image, :bird_icon, :breed_id ,:sex)
  end

end
