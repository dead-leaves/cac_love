class Admin::PostCommentsController < ApplicationController
    
  
  def index
    @posts = Post.all
    @post = Post.find(params[:id])
  end
    
  def show
    @post = Post.find(params[:id])
    @post = @user.post
  end
  
  
  def destroy
        PostComment.find(params[:id]).destroy
        redirect_to admin_post_path(params[:post_id])
  end
    
    
    private

  def post_comment_params
    params.require(:post_comment).permit(:user_id, :post_id, :comment )
  end
  
end
