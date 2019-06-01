class AddBodyToImagePosts < ActiveRecord::Migration[5.2]
  def change
    add_column :image_posts, :body, :string
  end
end
