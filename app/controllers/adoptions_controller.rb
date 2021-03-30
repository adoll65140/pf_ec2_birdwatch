class AdoptionsController < ApplicationController
  def index
    @adoptions = Adoption.all.page(params[:page]).per(6).order(created_at: :desc)
    @adoptions = @adoptions.where('breed_id LIKE ?', "#{params[:breed_id]}") if params[:breed_id].present?
    @adoptions = @adoptions.where('prefecture_code LIKE ?', "#{params[:prefecture_code]}") if params[:prefecture_code].present?
  end

  def edit
    @adoption = Adoption.find(params[:id])
    if @adoption.user == current_user
      render "edit"
    else
      redirect_to adoptions_path
    end
  end

  def update
    @adoption = Adoption.find(params[:id])
    if @adoption.update(adoption_params)
      flash[:notice] = '変更しました'
    redirect_to adoption_path(@adoption.id)
    else
      flash.now[:alert] = "内容をお確かめください"
      render :edit
    end
  end

  def show
    @adoption = Adoption.find(params[:id])
    if user_signed_in?
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @adoption.user.id)
    if @adoption.user.id == current_user.id
      @msg ="DM"
    else
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

  def new
    @adoption = Adoption.new
  end

  def create
    @adoption = Adoption.new(adoption_params)
    @adoption.user_id = current_user.id
    if @adoption.save
      flash[:notice] = '登録しました'
    redirect_to adoptions_path
    else
      flash.now[:alert] = "内容をお確かめください"
      render :new
    end
  end

  def destroy
    @adoption = Adoption.find(params[:id])
    @adoption.destroy
    redirect_to adoptions_path
  end

  private

  def adoption_params
    params.require(:adoption).permit(:title, :introduction, :health, :other, :background, :postcode, :prefecture_code, :address_city,
                                     :image, :age, :sex, :prefecture_name, :breed_id)
  end
end
