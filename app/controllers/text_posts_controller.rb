class TextPostsController < ApplicationController
  def show
    @post = TextPost.find(params[:id])
    render 'posts/show'
  end

  def new
    @post = current_user.text_posts.build
  end

  def create
    @post = current_user.text_posts.build params_for_post
    unless  @post.save
      flash[:error] = "Couldn't publish your post"
    end
    respond_to do |format|
      format.html { redirect_back fallback_location: posts_path }
      format.js
    end
    
  end

  def destroy
    @post = TextPost.find(params[:id])
    if @post.destroy
      flash[:notice] = "Post deleted"
    end
    redirect_back fallback_location: root_path
  end

  private

  def params_for_post
    params.require(:text_post).permit(:body)
  end
end
