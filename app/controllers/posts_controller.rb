class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @photo = @post.photos.build
  end
  
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to user_path(current_user)
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path(current_user)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:body, photos_attributes: [:image])
  end
end
