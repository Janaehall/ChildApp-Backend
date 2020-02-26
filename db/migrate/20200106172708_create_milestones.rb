require 'date'
class CreateMilestones < ActiveRecord::Migration[6.0]
  def change
    create_table :milestones do |t|
      t.integer :child_id
      t.string :content
      t.date :date
      t.timestamps
    end
  end
end
