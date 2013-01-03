class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :user_id,null: false
      t.integer :expert_id,null: false
      t.integer :thread_id,null: false
      t.integer :status,null: false,default: 0
      t.integer :messages_count,:default=>0 #messageの数を数えるためのカウンターキャッシュのカラム
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
