class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :date, :commentable_id, :user

  def date
    object.created_at
  end

  def user
    UserSerializer.new(object.user)
  end
end
