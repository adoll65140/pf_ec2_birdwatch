class HomesController < ApplicationController
  def home
    @user = current_user
    @post = Post.new
    @posts = @user.posts
  end
  
  def top
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to root_path
  end

  def about
  end
end
