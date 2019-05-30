class AddIndexToTextPost < ActiveRecord::Migration[5.2]
  def change
    add_index :text_posts, :user_id
  end
end
