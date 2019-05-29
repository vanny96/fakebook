class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def show_friends
    @friends = User.find(params[:id]).friends.page(1).per(20)
  end
end
