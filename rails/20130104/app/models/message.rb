#coding: utf-8
class Message < ActiveRecord::Base
  
  #acts_as_paranoidを使って論理削除する。
  acts_as_paranoid
 
  #sessionモデルと1対多関係を結ぶ。あと、messageの数をカウントするために、カウンターキャッシュを設定する。
  belongs_to :session,:counter_cache => true
  attr_accessible :content, :post_id,:session_id


  #バリデーション
  validates :content,presence: true
  validates :post_id,presence: true
  validates :session_id,presence: true




end
