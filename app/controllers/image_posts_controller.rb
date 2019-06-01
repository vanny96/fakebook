class ImagePostsController < ApplicationController
  def new
    @post = @current_user.image_posts.build
  end

  def show
    @post = ImagePost.find(params[:id])
  end
  
  def create
    @post = @current_user.image_posts.build
    @post.body = params[:image_post][:body]
    @post.image.attach params[:image_post][:picture]

    @post.save

    redirect_to @current_user
  end

  def destroy
    @post = ImagePost.find(params[:id])
    if @post.destroy
      flash[:notice] = "Post deleted"
    end
    redirect_to @current_user
  end
end
