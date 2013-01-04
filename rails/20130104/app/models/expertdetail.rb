#coding: utf-8
class Expertdetail < ActiveRecord::Base
  attr_accessible :price, :profile, :time

  #Userモデルと1対1関係にする。
  belongs_to :user

  #rails3_acts_as_paranoidライブラリを使うための処理。
  acts_as_paranoid






end
