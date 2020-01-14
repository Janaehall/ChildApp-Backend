require 'date'
class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :child_id
      t.string :content
      t.datetime :date, default: DateTime.now
      t.integer :user_id
      t.timestamps
    end
  end
end
