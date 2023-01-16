class Public::UsersController < ApplicationController
before_action :authenticate_user!, except: :show

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def withdraw
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to root_path
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
