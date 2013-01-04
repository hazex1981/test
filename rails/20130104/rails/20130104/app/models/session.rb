#codeing: utf-8
class Session < ActiveRecord::Base
  
  #rails3_acts_as_paranoidを適用して、論理削除できるようにする。messageも論理削除する。
  acts_as_paranoid 
  
  attr_accessible :expert_id, :status, :thread_id, :user_id

  #Messageモデルと１対多関係を結ぶ。Sessionが削除されたら、Messageも自動的に削除する。
  has_many :messages,:dependent => :destroy


  #バリデーション
  validates :expert_id,presence: true
  validates :user_id,presence: true
  validates :thread_id,presence: true
  validates :status,presence: true




end
