class LostBirdsController < ApplicationController
  def new
    @lost_bird = LostBird.new
  end

  def index
    @lost_birds = LostBird.all.page(params[:page]).per(6).order(created_at: :desc)
    @lost_birds = @lost_birds.where('breed_id LIKE ?', "#{params[:breed_id]}") if params[:breed_id].present?
    @lost_birds = @lost_birds.where('prefecture_code LIKE ?', "#{params[:prefecture_code]}") if params[:prefecture_code].present?
  end

  def edit
    @lost_bird = LostBird.find(params[:id])
    if @lost_bird.user == current_user
      render "edit"
    else
      redirect_to lost_birds_path
    end
  end

  def show
    @lost_bird = LostBird.find(params[:id])
    @lost_bird_comment = LostBirdComment.new
  end

  def create
    @lost_bird = LostBird.new(lost_bird_params)
    @lost_bird.user_id = current_user.id
    if @lost_bird.save
      flash[:notice] = '登録しました'
      redirect_to lost_birds_path
    else
      flash.now[:alert] = "内容をお確かめください"
      render :new
    end
  end

  def update
    @lost_bird = LostBird.find(params[:id])
    if @lost_bird.update(lost_bird_params)
    flash[:notice] = '変更しました'
    redirect_to lost_bird_path(@lost_bird.id)
    else
      flash.now[:alert] = "内容をお確かめください"
      render :edit
    end
  end

  def destroy
    @lost_bird = LostBird.find(params[:id])
    @lost_bird.destroy
    redirect_to lost_birds_path
  end

  private

  def lost_bird_params
    params.require(:lost_bird).permit(:lost_bird_name, :breed_id, :lost_bird_age, :feature, :lost_introduction, :prefecture_code,
                                      :lost_bird_introduction, :bird_image, :user, :lost_place, :title, :color, :sex, :lost_day, :prefecture_name)
  end
end
