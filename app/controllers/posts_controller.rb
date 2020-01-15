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
    find_post
    @post.delete
  end

  def update
    find_post
    @post.update(post_params)
    @post.save
    render json: @post
  end

  def add_photos
    find_post
    @post.photos.attach(params[:post][:photo])
    @post.save
    render json: {photos: @post.photos.map{|p| url_for(p)}}
  end

  def show
    find_post
    render json: @post
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:child_id, :content, :user_id, {photos: []})
  end
end
