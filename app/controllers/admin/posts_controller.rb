class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts = Post.page(params[:page])

  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to admin_posts_path
    else
      render :show
    end
  end

  def post_params
    params.require(:post).permit(:title, :body, :image, :user_id, :search_tag_id)
  end
end
