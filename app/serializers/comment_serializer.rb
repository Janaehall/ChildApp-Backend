class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user, :content, :date

  def date
    object.created_at
  end

  def user
    UserSerializer.new(object.user)
  end
end
