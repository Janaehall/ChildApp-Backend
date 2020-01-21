class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true
      t.integer :user_id
      t.string :content

      t.timestamps
    end
  end
end
