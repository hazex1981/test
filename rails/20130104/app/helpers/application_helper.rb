#coding: utf-8
module ApplicationHelper

  #改行をするためのメソッド
  def linebreaksbr(text)
    
    text = h text
    text.gsub(/\r\n|\r|\n/, "<br >").html_safe
  
  end



end
