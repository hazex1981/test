#coding: utf-8
class Category < ActiveRecord::Base
  
  attr_accessible :name, :parent_id,:delete_at

  #バリデーションはる。
  #Categoryのnameは、nil、空、重複を禁止する。
  validates :name,presence: true,uniqueness: true

  #ツリー構造にするための記述
  has_many :children,:class_name => "Category",:foreign_key => :parent_id 
  belongs_to :parent,:class_name => "Category",:foreign_key => :parent_id

  #rails3_acts_as_paranoidライブラリを使うための処理。
  acts_as_paranoid

  #中間モデルTaggingをつかって、Userモデルと多対多の関係をつくる。。
  #"dependent => :destroy"によって、Categoryの削除で、Taggingsも論理削除されるはず？。ここに関しては検証あり。
  has_many :taggings,:dependent => :destroy
  #sourceを使って、名前をexpertsにして、Category.expertsでデータを取り出せるようにする。
  has_many :experts,:through => :taggings, source: :user






end
