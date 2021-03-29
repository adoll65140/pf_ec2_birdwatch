class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @birds=@user.birds.page(params[:page]).per(1)
    if user_signed_in?
      @currentUserEntry=Entry.where(user_id: current_user.id)
      @userEntry=Entry.where(user_id: @user.id)
      unless @user.id == current_user.id
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            if cu.room_id == u.room_id then
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end
        if @isRoom != true
          @room = Room.new
          @entry = Entry.new
        end
      end
    end
  end

  def follower
    @title = "フォロー"
    @user = User.find(params[:id])
    @users = @user.follower
    render 'show_follow'
  end

  def followed
    @title = "フォロワー"
    @user = User.find(params[:id])
    @users = @user.followed
    render 'show_follow'
  end

  def index
    @users = User.all
  end

  def profile
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def check
    @user = current_user
    @birds = @user.birds
    @lost_birds = @user.lost_birds
    @protection_birds = @user.protection_birds

    bird_checks = BirdCheck.where(user_id: current_user.id).pluck(:bird_id)
    @bird_list = Bird.find(bird_checks)
    lost_checks = LostCheck.where(user_id: current_user.id).pluck(:lost_bird_id)
    @lost_list = LostBird.find(lost_checks)
    protection_checks = ProtectionCheck.where(user_id: current_user.id).pluck(:protection_bird_id)
    @protection_list = ProtectionBird.find(protection_checks)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :introduction, :icon, :back_image)
  end
end
