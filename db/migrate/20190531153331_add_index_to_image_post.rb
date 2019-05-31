class AddIndexToImagePost < ActiveRecord::Migration[5.2]
  def change
    add_column :image_posts, :user_id, :bigint
    add_index :image_posts, :user_id 
  end
end
