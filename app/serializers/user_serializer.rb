class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :email, :profile_pic
 
  def profile_pic
    if object.profile_pic.attached?
      url_for(object.profile_pic)
    else
      "https://www.sackettwaconia.com/wp-content/uploads/default-profile.png"
    end
  end

  def children
    object.children.map{|c| {id: c.id, name: c.name}}
  end

  def friends_children
    object.friends_children.map{|fc| {id: fc.id, name: fc.name}}
  end

end