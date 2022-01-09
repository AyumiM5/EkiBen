class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @posts = current_user.posts
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render "edit"
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :email)
  end
  
  def set_current_user
    @user = User.find(current_user.id)
  end
end
