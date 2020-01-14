class MilestoneSerializer < ActiveModel::Serializer
  attributes :id, :date, :content, :created_at
end
