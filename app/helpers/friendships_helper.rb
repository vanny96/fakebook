module FriendshipsHelper
  def already_friend? friend
    return true if current_user.friends.include?(friend)
  end

  def already_invited? friend
    return true if current_user.pending_friends.include?(friend)    
  end

  def invitable? friend
    return true if !already_friend?(friend) && current_user != friend
  end
end
