class ChildSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :birthdate, :birthday, :age, :photo, :parents, :family_members
  has_many :posts, include_nested_associations: true
  has_many :milestones, include_nested_associations: true
  # includes_all_nestedx :posts, :milestones
  def photo
    if object.photo.attached?
      url_for(object.photo)
    else
      "https://www.sackettwaconia.com/wp-content/uploads/default-profile.png"
    end
  end

  def info_only
    {id: object.id, photo: photo, name: object.name, birthday: birthday, age: age, birthdate: object.birthdate }
  end

  def birthday
    object.birthdate.strftime('%B %d')
  end

  def age
    bd = object.birthdate.strftime('%Y/%m/%d').split('/')
    time = DateTime.now.strftime('%Y/%m/%d').split('/')
    age = time[0].to_i - bd[0].to_i
    age -= 1 if time[1].to_i < bd[1].to_i
    age
  end

  # def posts
  #   object.posts.map{|post| PostSerializer.new(post)}
  # end

  def parents
    object.parents.map{|parent| UserSerializer.new(parent)}
  end

  def family_members
    object.family_members.map{|family_member| UserSerializer.new(family_member)}
  end

  # def milestones
  #   object.milestones.map{|m| MilestoneSerializer.new(m)}
  # end

end
