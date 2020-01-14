class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :content, :photos, :user, :comments, :created_at, :likes

  def photos
    object.photos.map{|photo| url_for(photo)}
  end

  def comments
    object.comments.map{|c| CommentSerializer.new(c)}
  end

  def user
    UserSerializer.new(object.user)
  end

  def likes
    object.likes.map{|l| LikeSerializer.new(l)}
  end

end
