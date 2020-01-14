class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    if comment.valid?
      render json: comment
    else
      render json: {error: comment.errors.full_messages}
    end
  end

  def destroy
    Comment.find(params[:id]).delete
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
