module UserLikeLikeablesHelper
  def liked_already? likeable
    likeable.user_likes_likeables.exists?(user_id: @current_user.id)
  end
end
