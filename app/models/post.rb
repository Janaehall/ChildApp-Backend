class Post < ApplicationRecord
  has_many_attached :photos
  has_many :comments
  has_many :likes
  belongs_to :child
  belongs_to :user
  validates :content, presence: true
end
