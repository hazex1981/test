#coding: utf-8
#Userモデル。
class User < ActiveRecord::Base
  
  attr_accessible :email, :expert, :name,:sex, :bio, :birthday,
                  :step, :uid,:deleted_at,:category_ids,:expertdetail

  #バリデーションをつける。
  #nameは重複の可能性あり。
  validates :name,presence: true
  #uidとemailは、nil、空、重複を禁止する。
  validates :uid,presence: true,uniqueness: true
  validates :email,presence: true,uniqueness: true

  #rails3_acts_as_paranoidライブラリを使うための処理。
  acts_as_paranoid
  
  #中間モデルTaggingをつかって、Categoryモデルと多対多の関係を結ぶ。
  #"dependent => :destroy"によって、Categoryの削除で、Taggingsも論理削除されるはず？。ここに関しては検証あり。
  has_many :taggings,:dependent => :destroy
  has_many :categories,:through => :taggings,source: :category

  #Expertの詳細のExpertdetailモデルと1対1の関係を結ぶ。
  has_one :expertdetail,:dependent => :destroy




end
