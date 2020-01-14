class LikesController < ApplicationController
  def create
    like = Like.create(like_params)
    render json: like
  end

  def destroy
    Like.find(params[:id]).delete
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
