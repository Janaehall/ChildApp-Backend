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
    Post.find(params[:id]).delete
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    post.save
    render json: post
  end

  def add_photos
    post = Post.find(params[:id])
    post.photos.attach(params[:post][:photo])
    post.save
    render json: {photos: post.photos.map{|p| url_for(p)}}
  end

  def show
    post = Post.find(params[:id])
    render json: post
  end

  def post_params
    params.require(:post).permit(:photo, :child_id, :content, :user_id)
  end
end
