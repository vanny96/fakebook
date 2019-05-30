module UserLikePostsHelper
  def liked_post? post
    if post.is_a? TextPost
      return true if current_user.liked_text_posts.include? post
    else
    end
  end
end
