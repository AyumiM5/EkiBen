class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
    @photo = @post.photos.build
  end
  
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      if params[:photos].present?
        params[:photos][:image].each do |a|
          @photo = @post.photos.create!(post_id: @post.id)
        end
      end
      redirect_to posts_path
    else
      render 'new'
    end
    redirect_to user_path(current_user)
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to user_path(current_user)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:body, photos_attributes: [:image])
  end
end
