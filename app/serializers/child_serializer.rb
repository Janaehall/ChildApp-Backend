class ChildSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :birthdate, :birthday, :age, :photo, :posts, :milestones, :parents, :family_members

  def photo
    if object.photo.attached?
      url_for(object.photo)
    else
      "https://www.sackettwaconia.com/wp-content/uploads/default-profile.png"
    end
  end

  def birthday
    object.birthday
  end

  def age
    object.age
  end

  def posts
    object.posts.map{|post| PostSerializer.new(post)}
  end

  def parents
    object.parents.map{|parent| UserSerializer.new(parent)}
  end

  def family_members
    object.family_members.map{|family_member| UserSerializer.new(family_member)}
  end

  def milestones
    object.milestones.map{|m| MilestoneSerializer.new(m)}
  end

end
