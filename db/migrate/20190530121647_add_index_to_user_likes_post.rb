class AddIndexToUserLikesPost < ActiveRecord::Migration[5.2]
  def change
    add_index :user_likes_posts, :user_id
  end
end
