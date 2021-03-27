class SearchController < ApplicationController
  def search
    @model = params[:model]
    if @model == "user"
      @users = User.search(params[:search])
    elsif @model == "post"
      @posts = Post.search(params[:search])
    elsif @model == "bird"
      @birds = Bird.search(params[:search])
    end
  end
end
