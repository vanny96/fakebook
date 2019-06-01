class UsersController < ApplicationController
  before_action :user_authenticated?, only: :show

  def index
    @users = User.all.filter{|user| user.active_for_authentication?}
    @users = Kaminari.paginate_array(@users).page(params[:page]).per(50)
  end

  def show
    
    
    @requests = @user.friendship_request_received.includes(:user)
    @user_posts = @user.posts

    @post = @user.text_posts.build
  end

  def update
    user = User.find(params[:id])

  end

  def show_friends
    @friends = User.find(params[:id]).friends.page(1).per(20)
  end

  private

  def user_authenticated?
    @user = User.find(params[:id])
    unless @user.active_for_authentication?
      redirect_to users_path 
      flash[:error] = "User not yet authenticated"
    end
  end
end
