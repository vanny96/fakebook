class ProfilePicturesController < ApplicationController
  def create
    user = User.find(params[:id])
    user.profile_image.attach params[:photo][:profile_image]
    flash[:notice] = "Profile picture updated"
    redirect_to user
  end

  def destroy
  end

  def update
    user = User.find(params[:id])
    user.profile_image.purge
    user.profile_image.attach params[:photo][:profile_image]
    flash[:notice] = "Profile picture updated"
    redirect_to user
  end

end
