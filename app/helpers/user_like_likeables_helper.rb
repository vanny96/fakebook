module UserLikeLikeablesHelper
  def liked_post? likeable
    likeable.user_likes_likeables.exists?(user_id: @current_user.id)
  end
end
