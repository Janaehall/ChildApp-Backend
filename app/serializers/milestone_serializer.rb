class MilestoneSerializer < ActiveModel::Serializer
  attributes :id, :date, :content, :created_at, :child_id, :comments, :likes

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
