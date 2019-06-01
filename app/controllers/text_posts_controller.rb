class TextPostsController < ApplicationController
  def show
    @post = TextPost.find(params[:id])
    render 'posts/show'
  end

  def create
    @post = current_user.text_posts.build params_for_post
    unless  @post.save
      flash[:error] = "Couldn't publish your post"
    end
    redirect_back fallback_location: posts_path
  end

  def destroy
    @post = TextPost.find(params[:id])
    if @post.destroy
      flash[:notice] = "Post deleted"
    end
    redirect_to @current_user
  end

  private

  def params_for_post
    params.require(:text_post).permit(:body)
  end
end
