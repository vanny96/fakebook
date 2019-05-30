class CreateUserLikesPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :user_likes_posts do |t|
      t.integer :user_id
      t.references :post, polymorphic: true, index: true

      t.timestamps
    end
  end
end
