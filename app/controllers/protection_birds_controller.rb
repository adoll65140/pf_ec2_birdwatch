class ProtectionBirdsController < ApplicationController
  def new
    @protection_bird = ProtectionBird.new
  end

  def index
    @protection_birds = ProtectionBird.all.page(params[:page]).per(6).order(created_at: :desc)
    @protection_birds = @protection_birds.where('breed_id LIKE ?', "#{params[:breed_id]}") if params[:breed_id].present?
    @protection_birds = @protection_birds.where('prefecture_code LIKE ?', "#{params[:prefecture_code]}") if params[:prefecture_code].present?
  end

  def edit
    @protection_bird = ProtectionBird.find(params[:id])
  end

  def show
    @protection_bird = ProtectionBird.find(params[:id])
    @protection_bird_comment = ProtectionBirdComment.new
  end

  def create
    @protection_bird = ProtectionBird.new(protection_bird_params)
    @protection_bird.user_id = current_user.id
    @protection_bird.save
    redirect_to protection_birds_path
  end

  def update
    @protection_bird = ProtectionBird.find(params[:id])
    @protection_bird.update(protection_bird_params)
    redirect_to protection_bird_path(protection_bird.id)
  end

  def destroy
    @protection_bird = ProtectionBird.find(params[:id])
    @protection_bird.destroy
    redirect_to protection_birds_path
  end

  private

  def protection_bird_params
    params.require(:protection_bird).permit(:breed_id, :feature, :bird_introduction, :title, :sex, :color, :prefecture_code,
                                            :protect_place, :image, :protect_introduction, :protect_day)
  end

end
