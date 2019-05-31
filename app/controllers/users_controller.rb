class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    
    @requests = @user.friendship_request_received.includes(:user)
    @user_posts = @user.posts

    @post = @user.text_posts.build
  end

  def show_friends
    @friends = User.find(params[:id]).friends.page(1).per(20)
  end
end
