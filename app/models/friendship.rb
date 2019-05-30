class Friendship < ApplicationRecord
  after_create :create_inverse_friendship
  after_destroy :destroy_inverse_friendship

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user, uniqueness: {scope: :friend}

  def create_inverse_friendship
    Friendship.create(user_id: self.friend_id, friend_id: self.user_id)
  end

  def destroy_inverse_friendship
    if inverse_friendship = Friendship.where("user_id = ? AND friend_id = ?", self.friend_id, self.user_id).first
      inverse_friendship.destroy
    end
  end
end
