#coding: utf-8
#Userモデルに、adminを追加
class ModifyUsers < ActiveRecord::Migration
  
  def up
  
    add_column :users,:admin,:boolean,default: false  




  end

  
  def down
  
  
  
  end





end
