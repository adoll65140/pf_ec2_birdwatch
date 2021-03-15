class BreedsController < ApplicationController
  def index
    @breed = Breed.new
    @breeds = Breed.all
  end

  def edit
    @breed = Breed.find(params[:id])
  end
  
  def create
  	@breed = Breed.new(breed_params)
    if @breed.save
       redirect_to breeds_path
    else
      @breeds = Breed.all
      render :index
    end
  end
  
  def update
    @breed = Breed.find(params[:id])
    if @breed.update(breed_params)
      redirect_to breeds_path
    else
      render :edit
    end
  end
  
  private

  def breed_params
    params.require(:breed).permit(:name)
  end

end
