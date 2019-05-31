class ImagePostsController < ApplicationController
  def new
    @post = @current_user.image_posts.build
  end

  def show
    @post = ImagePost.find(params[:id])
  end
  
  def create
    @post = @current_user.image_posts.build
    @post.image.attach params[:image_post][:picture]
    @post.save

    redirect_to @current_user
  end
end
