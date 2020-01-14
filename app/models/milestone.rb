class Milestone < ApplicationRecord
  belongs_to :child
  validates :date, presence: true
  validates :content, presence: true
end
