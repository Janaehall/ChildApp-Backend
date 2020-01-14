include Rails.application.routes.url_helpers
class User < ApplicationRecord
  has_secure_password
  has_many :parent_children, foreign_key: 'parent_id'
  has_many :children, through: :parent_children
  has_many :child_families, foreign_key: 'family_member_id'
  has_many :friends_children, through: :child_families, source: 'child'
  has_one_attached :profile_pic
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true

end
