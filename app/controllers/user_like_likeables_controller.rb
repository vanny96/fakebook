class UserLikeLikeablesController < ApplicationController
  def create
    like = current_user.user_likes_likeables.build params_for_like
    like.save 
    redirect_back fallback_location: posts_path
  end

  def destroy
    like = UserLikesLikeable.find(params[:id])
    like.destroy
    redirect_back fallback_location: posts_path
  end

  private 

  def params_for_like
    params.require(:like).permit(:likeable_id, :likeable_type)
  end
end
