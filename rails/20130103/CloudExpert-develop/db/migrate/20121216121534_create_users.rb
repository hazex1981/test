class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,null: false
      t.string :uid,null: false ,:unique => true
      t.string :email,null: false,:unique => true
      t.string :image,null: false
      t.text :bio,null: false
      t.string :sex,null: false
      t.string :birthday,null: false
      t.boolean :expert,default: false
      t.integer :step
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
