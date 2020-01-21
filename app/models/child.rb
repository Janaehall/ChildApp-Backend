class Child < ApplicationRecord
  has_one_attached :photo
  has_many_attached :videos
  has_many :parent_children
  has_many :child_families
  has_many :parents, through: :parent_children, class_name: 'User'
  has_many :family_members, through: :child_families, class_name: 'User'
  has_many :milestones
  has_many :posts
  validates :name, presence: true
  validates :birthdate, presence: true
end
