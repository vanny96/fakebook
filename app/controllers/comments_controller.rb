class CommentsController < ApplicationController
  def create
    comment = current_user.comments.build params_for_comment
    comment.save
    redirect_to params[:comment][:url]
  end

  def destroy
  end

  private

  def params_for_comment
    params.require(:comment).permit(:body, :post_id, :post_type)
  end
end
