class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts = Post.page(params[:page])

  end

  def show
    @post = Post.find(params[:id])
    
  end



  def post_params
    params.require(:post).permit(:title, :body, :image, :user_id, :search_tag_id)
  end
end
