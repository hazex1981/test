#coding: utf-8
class ApplicationController < ActionController::Base
  
  protect_from_forgery

  before_filter :authorize
  
  private
  #すべてのコントローラーのアクションの実行時にこの処理を行う。
  def authorize
    if cookies.signed[:user_id]
      #ログインユーザーのオブジェクトを@current_user変数にいれる。
      @current_user = User.find_by_id(cookies.signed[:user_id])
      logger.debug(@current_user.inspect)
      cookies.delete :user_id unless @current_user
    end
  end

  #ログインされているかどうかを調べるアクション。各コントローラーの実行前に行う。
  #"before_filter :login_required"の実行で行う。
  def login_required
    
    #@current_userがnilだった、ログインページに戻る。
    return redirect_to :login unless @current_user
    #current_userのステップが1だった、ユーザー登録ページにリダイレクトする。
    return redirect_to register_user_path(@current_user.id) if @current_user && @current_user.step == nil

  end







end
