class CreateExpertdetails < ActiveRecord::Migration
  def change
    create_table :expertdetails do |t|
      t.integer :user_id,null: false
      t.text :detail
      t.text :price
      t.text :time
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
