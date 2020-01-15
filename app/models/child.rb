class Child < ApplicationRecord
  has_many :parent_children
  has_many :parents, through: :parent_children, class_name: 'User'
  has_many :milestones
  has_one_attached :photo
  has_many :posts
  has_many :child_families
  has_many :family_members, through: :child_families, class_name: 'User'
  validates :name, presence: true
  validates :birthdate, presence: true

  def age
    bd = birthdate.strftime('%Y/%m/%d').split('/')
    time = DateTime.now.strftime('%Y/%m/%d').split('/')
    age = time[0].to_i - bd[0].to_i
    age -= 1 if time[1].to_i < bd[1].to_i
    age 
   end

end
