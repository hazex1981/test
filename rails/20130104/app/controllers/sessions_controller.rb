#coding: utf-8
#sessionsのコントローラー
class SessionsController < ApplicationController
  
  #ログインされてるかどうかを判定する。
  before_filter :login_required

  
  
  
  #新しいセッションをつくるためのアクション  
  def new
  
    #エキスパートのidをいれる。
    @expert_id = params[:q]

    #エキスパートの情報をとる。
    @expert = User.find_by_id_and_expert(@expert_id,true)

    #一番新しいセッションを取り出す。
    @last_session = Session.where(:user_id => @current_user.id,:expert_id => @expert_id).last

    #一番新しいセッションがなかったら、新しいセッションをつくる。
    @session = Session.new(:user_id => @current_user.id,:expert_id => @expert_id,:thread_id => 1) unless @last_session 

    #一番新しいセッションのstatusが0か1だったら、エラーを起こす。
    return raise if @last_session && (@last_session.status == Settings.free_status || @last_session.status == Settings.charge_status )

    #新しいセッションをつくる。
    @session = Session.new(:user_id => @current_user.id,:expert_id => @expert_id,:thread_id => @last_session.thread_id + 1 ) if @last_session


  end


  #コメントを投稿するためのアクション
  def create

    #メッセージ内容をとりだす。
    @content = params[:content]

    #contentの中身がからだったら、もどる。
    return redirect_to request.env["HTTP_REFERER"] if @content == ""

    #セッションの情報を取得する。
    @session = Session.new
    @session.attributes = params[:session]

    #保存する。されなかったら、エラーを起こす。
    return raise unless @session.save

    @message = @session.messages.new(:post_id => @current_user.id,:content => @content)
    if @message.save
     
      #保存されたらする処理。Messageリソースにとぶ。
      return redirect_to session_messages_path(@session.id)  

    else

      #エラー処理を起こす。
      return raise

    end

  end

  #パスをするためのアクション
  def pass
    
    @session_id = params[:id]

    #セッションの情報を取り出す。
    @session = Session.find_by_id(@session_id)
    return raise ActiveRecord::RecordNotFound unless @session

    #ステータスをパスにする。
    @session.status = Settings.pass_status

    #保存する。
    if @session.save
      
      #リダイレクトする。
      return redirect_to request.env["HTTP_REFERER"]

    else

      #エラー処理。
      return raise

    end

  end

  #エンドをするためのアクション
  def end

    @session_id = params[:id]
    
    #セッションの情報を取り出す。
    @session = Session.find_by_id(@session_id)
    return raise ActiveRecord::RecordNotFound unless @session

    #ステータスをエンドにする。
    @session.status = Settings.end_status

    #保存する。
    if @session.save

      #リダイレクトする。
      return redirect_to request.env["HTTP_REFERER"]

    else

      #エラー処理。
      return raise

    end

  end

  #振り分けるためのアクション
  def divide

    #エキスパートのidをいれる。
    @expert_id = params[:q]

    #一番新しいセッションを取り出す。
    @last_session = Session.where(:user_id => @current_user.id,:expert_id => @expert_id).last   

    #@last_sessionがない場合や、@last_sessionがパスや、終了の場合にする処理。
    if !@last_session || @last_session.status == Settings.pass_status || @last_session.status == Settings.end_status
      #新しいセッションをつくるために、newアクションにリダイレクトする。   
      redirect_to :controller => "sessions",:action => "new",:q => @expert_id 
      return
    
    elsif @last_session.status == Settings.free_status || @last_session.status == Settings.charge_status
      #セッション中のセッションページにいく。
      redirect_to session_messages_path(@last_session.id) 
      return
    
    end





  end













end
