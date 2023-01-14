class Public::PostsController < ApplicationController
before_action :authenticate_user!, except: :show

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @posts = Post.all
    @post.user_id = current_user.id
    @user = current_user
      if @post.save!
      redirect_to post_path(@post.id)
      else
      render :index
      end
  end

  def index
    @posts = Post.all
    @user = current_user

    if params[:tag]
      Tag.create(tag_name: params[:tag])
    end


    if params[:tag_ids]
      @post = []
      params[:tag_ids].each do |key, value|
        if value == "1"
          tag_post = Tag.find_by(tag_name: key).post
          @post = @post.empty? ? tag_post : @post & tag_post
        end
      end
    end

  end

  def show
    @post = Post.find(params[:id])

  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])

  end



  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :user_id, tag_ids: [] )
  end
end
