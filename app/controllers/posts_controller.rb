class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.new(post_params)
    @post.save
    redirect_to user_path(current_user)
  end

  def edit
  end
  
  private
  
  def post_params
    params.require(:post).permit(:body)
  end
end
