class ParentChild < ApplicationRecord
  belongs_to :parent, class_name: 'User'
  belongs_to :child
end
