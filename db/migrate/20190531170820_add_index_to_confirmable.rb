class AddIndexToConfirmable < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :confirmation_token, unique: true
  end
end
