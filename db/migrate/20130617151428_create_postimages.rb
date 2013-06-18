class CreatePostimages < ActiveRecord::Migration
  def change
    create_table :postimages do |t|
      t.integer :micropost_id
      t.string :name

      t.timestamps
    end
    add_index :postimages, [:micropost_id, :created_at]
  end
end
