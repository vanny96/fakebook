class UserLikePostsController < ApplicationController
  def create
    like = current_user.user_likes_posts.build params_for_like
    like.save 
    redirect_to params[:like][:url]
  end

  def destroy
    like = UserLikesPost.find(params[:id])
    like.destroy
    redirect_to params[:like][:url]
  end

  private 

  def params_for_like
    params.require(:like).permit(:post_id, :post_type)
  end
end
