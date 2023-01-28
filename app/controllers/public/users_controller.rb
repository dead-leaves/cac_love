class Public::UsersController < ApplicationController
before_action :authenticate_user!, except: :show
before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC").page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
     redirect_to user_path(@user)
    else
      render :edit
    end
    
  end

  def withdraw
    @user = User.find(params[:id])
  end
  
  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
    @favorite_post = Post.order("created_at DESC").page(params[:page])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to root_path
    else
      render user_path(current_user)
    end
  end



  private
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user), notice: 'ゲストユーザーはプロフィール編集できません'
    end
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
