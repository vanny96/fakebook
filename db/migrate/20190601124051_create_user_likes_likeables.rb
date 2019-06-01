class CreateUserLikesLikeables < ActiveRecord::Migration[5.2]
  def change
    create_table :user_likes_likeables do |t|
      t.bigint :user_id
      t.string :likeable_type
      t.bigint :likeable_id

      t.timestamps
    end
    add_index :user_likes_likeables, :user_id
    add_index :user_likes_likeables, [:likeable_id, :likeable_type]
  end
end
