class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end


  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
