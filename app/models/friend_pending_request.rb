class FriendPendingRequest < ApplicationRecord
  belongs_to :user
  belongs_to :pending_friend, class_name: 'User'

  validate :already_friend?

  def already_friend?
    if self.user.friends.include?(pending_friend)
      errors.add(self.pending_friend.full_name , "Is already your friend")
    end
  end

  def accept_request
    user.friends << pending_friend
    destroy
  end

  def refuse_request
    destroy
  end
end
