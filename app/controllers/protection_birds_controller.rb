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
    if @protection_bird.user == current_user
      render "edit"
    else
      redirect_to protection_birds_path
    end
  end

  def show
    @protection_bird = ProtectionBird.find(params[:id])
    @protection_bird_comment = ProtectionBirdComment.new
  end

  def create
    @protection_bird = ProtectionBird.new(protection_bird_params)
    @protection_bird.user_id = current_user.id
    if @protection_bird.save
      flash[:notice] = '登録しました'
    redirect_to protection_birds_path
    else
      flash.now[:alert] = "内容をお確かめください"
      render :new
    end
  end

  def update
    @protection_bird = ProtectionBird.find(params[:id])
    if @protection_bird.update(protection_bird_params)
      flash[:notice] = '変更しました'
      redirect_to protection_bird_path(protection_bird.id)
    else
      flash.now[:alert] = "内容をお確かめください"
      render :edit
    end
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
