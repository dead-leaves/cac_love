class Public::PostsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]

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
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all

    if params[:tag]
      Tag.create(tag_name: params[:tag])
    end


    if params[:tag_ids]
      @posts = []
      params[:tag_ids].each do |key, value|
        if value == "1"
          tag_posts = Tag.find_by(tag_name: key).posts
          @posts = @posts.empty? ? tag_posts : @posts & tag_posts
        end
      end
    end

  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    
  end

  def edit
    @post = Post.find(params[:id])

  end

  def update
    @post = Post.find(params[:id])
    @posts = Post.all
    @post.user_id = current_user.id
    @user = current_user
      if @post.update(post_params)
      redirect_to post_path(@post.id)
      else
      render :index
      end
  end


  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path
    else
      render :show
    end
  end



  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :user_id, tag_ids: [] )
  end
end
