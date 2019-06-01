class FriendPendingRequestsController < ApplicationController
  def create
    request = current_user.friendship_request_sent.build(pending_friend_id: params[:request][:friend_id])
    if request.save
      flash[:notice] = "Succesfully invited"
      redirect_back fallback_location: posts_path
    end
  end

  def destroy
    request = FriendPendingRequest.find(params[:id])
    name = request.user.full_name
    if request.destroy
      flash[:notice] = "You have refused #{name} friendship request"
      redirect_to current_user
    end  
  end
end
