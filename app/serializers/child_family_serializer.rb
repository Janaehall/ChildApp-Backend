class ChildFamilySerializer < ActiveModel::Serializer
  attributes :id, :child_id, :family_member_id
end
