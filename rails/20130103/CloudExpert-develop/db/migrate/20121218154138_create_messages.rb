class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :session,null: false
      t.integer :post_id,null: false
      t.text :content,null: false
      t.timestamp :deleted_at

      t.timestamps
    end
    add_index :messages, :session_id
  end
end
