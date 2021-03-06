class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    if comment.valid?
      render json: comment
    else
      render json: {error: comment.errors.full_messages}
    end
  end
  
  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    comment.save
    render json: comment
  end

  def destroy
    Comment.find(params[:id]).delete
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :commentable_id, :commentable_type)
  end
end
