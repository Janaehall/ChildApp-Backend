class ParentChildSerializer < ActiveModel::Serializer
  attributes :id, :parent_id, :child_id
end
