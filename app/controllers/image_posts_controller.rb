class ImagePostsController < ApplicationController
  def new
    @post = @current_user.image_posts.build
  end

  def show
    @post = ImagePost.find(params[:id])
    render 'posts/show'
  end
  
  def create
    @post = @current_user.image_posts.build params_for_post
    @post.image.attach params[:image_post][:picture]

    unless  @post.save
      flash[:error] = "Couldn't publish your post"
    end
    respond_to do |format|
      format.html { redirect_back fallback_location: posts_path }
      format.js { render file: 'posts/create'}
    end
    
  end

  def destroy
    @post = ImagePost.find(params[:id])
    if @post.destroy
      flash[:notice] = "Post deleted"
    end
    redirect_back fallback_location: root_path
  end

  private

  def params_for_post
    params.require(:image_post).permit(:body)
  end
end
