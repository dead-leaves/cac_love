class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to user_path
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
