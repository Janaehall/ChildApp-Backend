class ChildFamily < ApplicationRecord
  belongs_to :family_member, class_name: 'User'
  belongs_to :child
end
