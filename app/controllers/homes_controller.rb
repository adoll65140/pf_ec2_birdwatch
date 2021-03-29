class HomesController < ApplicationController
  def home
    @user = current_user
    @post = Post.new
    @posts = @user.posts.order(created_at: :desc)
  end

  def top
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to home_path
  end

  def about
  end
end
