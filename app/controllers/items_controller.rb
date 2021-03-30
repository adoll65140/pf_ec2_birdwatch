class ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(6).order(created_at: :desc)
    @items = @items.where('genre_id LIKE ?', "#{params[:genre_id]}") if params[:genre_id].present?
    @items = @items.where('prefecture_code LIKE ?', "#{params[:prefecture_code]}") if params[:prefecture_code].present?
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user == current_user
      render "edit"
    else
      redirect_to items_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = '変更しました'
    redirect_to item_path(@item.id)
    else
      flash.now[:alert] = "内容をお確かめください"
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
    if user_signed_in?
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @item.user.id)
    unless @item.user.id == current_user.id
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
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
       flash[:notice] = '登録しました'
    redirect_to items_path
    else
      flash.now[:alert] = "内容をお確かめください"
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:item, :introduction, :postcode, :prefecture_code, :address_city,
                                     :image, :prefecture_name, :genre_id)
  end
end
