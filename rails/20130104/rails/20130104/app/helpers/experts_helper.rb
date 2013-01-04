#coding: utf-8
module ExpertsHelper

  #カテゴリーの名前だけ取り出す。
  def categorytext(expert)
    #カテゴリーの名前だけ取り出す。
    @categorynames = expert.categories.map{|m| m.name}

    @text = ""
    @categorynames.each do |name|
      @text << name +","
    end

    #最後のコンマを削除する。
    return @text.chop!
  end


end
