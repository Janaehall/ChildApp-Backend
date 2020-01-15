class MilestoneSerializer < ActiveModel::Serializer
  attributes :id, :date, :content, :created_at, :child_id
end
