class Post < ApplicationRecord
  has_many_attached :photos
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  belongs_to :child
  belongs_to :user
  validates :content, presence: true
end
