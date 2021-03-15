class AdoptionsController < ApplicationController
  def index
    @adoptions = Adoption.all
  end

  def edit
    @adoption = Adoption.find(params[:id])
  end

  def update
    @adoption = Adoption.find(params[:id])
    @adoption.update(adoption_params)
    redirect_to adoption_path(@adoption.id)
  end

  def show
    @adoption = Adoption.find(params[:id])
  end

  def new
    @adoption = Adoption.new
  end

  def create
    @adoption = Adoption.new(adoption_params)
    @adoption.user_id = current_user.id
    @adoption.save
    redirect_to adoptions_path
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
