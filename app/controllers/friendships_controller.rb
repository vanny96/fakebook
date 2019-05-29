class FriendshipsController < ApplicationController
  def create
    request = FriendPendingRequest.find(params[:request][:id])
    user_name = request.user.full_name
    if request.accept_request
      flash[:notice] = "You're now friend with #{user_name}"
    end
    redirect_to current_user
  end

  def destroy
  end
end
