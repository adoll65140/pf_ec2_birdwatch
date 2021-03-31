class HomesController < ApplicationController
  before_action :authenticate_user!, only: [:home]
  
  def home
    @user = current_user
    @post = Post.new
    @posts = @user.posts.order(created_at: :desc)
  end

  def top
  end

end
