class Milestone < ApplicationRecord
  belongs_to :child
  has_many :likes, as: :likeable
  has_many :comments, as: :commentable
  validates :date, presence: true
  validates :content, presence: true
end
