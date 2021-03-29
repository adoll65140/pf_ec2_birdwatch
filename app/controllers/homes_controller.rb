class HomesController < ApplicationController
  def home
    @user = current_user
    @post = Post.new
    @posts = @user.posts.order(created_at: :desc)
  end

  def top
  end

end
