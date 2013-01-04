#coding: utf-8
#Adminの上位クラス
class Admin::Base < ApplicationController

  #adminで必ず実行されるメソッド。
  before_filter :admin_login_required

  private
  def admin_login_required
    
    #管理人じゃなかったら、エラーを起こす。
    return raise Forbidden unless @current_user.admin 

  end


end



