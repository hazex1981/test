class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name,null: false
      t.integer :parent_id
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
