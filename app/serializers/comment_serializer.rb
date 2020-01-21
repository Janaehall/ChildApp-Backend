class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user, :content, :date, :commentable_id

  def date
    object.created_at
  end

  def user
    UserSerializer.new(object.user)
  end
end
