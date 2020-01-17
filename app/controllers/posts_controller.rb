class PostsController < ApplicationController

  def create
    post = Post.create(post_params)
    if post.valid? 
      render json: post
    else
      render json: {errors: post.errors.full_messages}
    end
  end

  def destroy
    post.delete
  end

  def update
    post.update(post_params)
    post.save
    render json: post
  end

  def show
    render json: post
  end

  private

  def post
    Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:child_id, :content, :user_id, {photos: []})
  end
end
