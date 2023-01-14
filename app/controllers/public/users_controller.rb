class Public::UsersController < ApplicationController
before_action :authenticate_usre!

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def withdraw

  end



  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
