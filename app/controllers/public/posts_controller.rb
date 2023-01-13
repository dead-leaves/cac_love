class Public::PostsController < ApplicationController
  before_action :authenticate_usre!, except: [:index, :show]
  
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body, :image,:user_id, :search_tag_id)
  end
end
