#coding: utf-8
#管理画面のusersコントローラー
class Admin::UsersController < Admin::Base
  
  #ユーザを一覧表示  
  def index

    @users = User.all
 
    #削除されたユーザーを取り出す。
    @deleted_users = User.only_deleted
    

  end

  #ユーザーの詳細 
  def show
 
    @user = User.find_by_id(params[:id])
    return raise unless @user

  
  
  end

  
  def new
  
 



  
  
  end

  
  #権限を変更するためのメソッド
  def authchange

    @user = User.find_by_id(params[:id])
    return raise unless @user

    #expert属性をtrueとfalseを変更する。 
    @user.toggle(:expert)

    if @user.save
      
      #リダイレクトする。
      return redirect_to admin_user_path(@user.id)

    else
      
      #エラー処理。
      return raise

    end



  end





end
