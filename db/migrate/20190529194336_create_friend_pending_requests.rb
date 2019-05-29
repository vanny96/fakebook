class CreateFriendPendingRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_pending_requests do |t|
      t.integer :user_id
      t.integer :pending_friend_id

      t.timestamps
    end
    add_index :friend_pending_requests, :user_id
    add_index :friend_pending_requests, :pending_friend_id
  end
end
