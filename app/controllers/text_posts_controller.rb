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
    redirect_to params[:text_post][:url] 
  end

  def destroy
  end

  private

  def params_for_post
    params.require(:text_post).permit(:body)
  end
end
