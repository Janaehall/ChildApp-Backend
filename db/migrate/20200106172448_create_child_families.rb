class CreateChildFamilies < ActiveRecord::Migration[6.0]
  def change
    create_table :child_families do |t|
      t.integer :child_id
      t.integer :family_member_id

      t.timestamps
    end
  end
end
