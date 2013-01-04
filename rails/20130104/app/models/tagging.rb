class Tagging < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  # attr_accessible :title, :body


  #rails3_acts_as_paranoidライブラリを使うための処理。
  acts_as_paranoid


end
