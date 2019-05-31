class PostsController < ApplicationController
  def index
    @posts = current_user.feed
    @post = TextPost.new
  end
end
