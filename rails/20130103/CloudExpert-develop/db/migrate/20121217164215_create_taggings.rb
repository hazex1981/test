class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :category
      t.references :user
      t.timestamp :deleted_at
      
      
      t.timestamps
    end
    add_index :taggings, :category_id
    add_index :taggings, :user_id
  end
end
