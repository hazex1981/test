#coding: utf-8
#Userコントローラー
class UsersController < ApplicationController

  #ログインされてるかどうかを判定する。
  before_filter :login_required,:only => [:profile]
  
  #登録するアクション  
  def register
  
    return redirect_to :login unless @current_user
    return redirect_to :root if @current_user && @current_user.step == 1 

    @user = User.find_by_id(params[:id])

    #userが見つからなかったらエラー処理をする。
    return raise ActiveRecord::RecordNotFound if @user.nil?
    #ログインユーザー@current_userと@userが一致しなかったらエラーを起こす。
    return raise unless @current_user == @user
    
    #レイアウトを"layout/user.index"に変更する。
    render :action => "register", :layout => "user"

  end


  def registered

    return redirect_to :login unless @current_user
    return redirect_to :root if @current_user && @current_user.step == 1 
    
    @user = User.find_by_id(params[:id])
    #userが見つからなかったらエラー処理をする。
    return raise ActiveRecord::RecordNotFound if @user.nil?
    
    @user.email = params[:user]["email"]
    @user.step = 1

    if @user.save
      #保存に成功したら、カテゴリーのコントローラーに飛ぶ。
      return redirect_to :root 
    else
      #ユーザー登録が面にもどる。
      return redirect_to register_user_path(params[:id])
    end


  end

  #ログインユーザーのプロフィールを表示するアクション
  def profile

    





  end












end
