#coding: utf-8
class MessagesController < ApplicationController
  
  #ログインされてるかどうかを判定する。
  before_filter :login_required
  
  def index
    
    #Sessionオブジェクトをとりだす。
    @session = Session.find_by_id(params[:session_id]) 
    return raise ActiveRecord::RecordNotFound unless @session

    @status = @session.status
    #sessionモデルの中にログインユーザーがはいってなかったら、エラー
    return raise unless @session.user_id == @current_user.id || @session.expert_id == @current_user.id

    #ユーザー側かエキスパート側かを判定する。
    @role = "user" if @session.user_id == @current_user.id
    @role = "expert" if @session.expert_id == @current_user.id
  
    #相手の情報のオブジェクトを取得。
    @partner = User.find_by_id(@session.expert_id) if @role == "user"
    @partner = User.find_by_id(@session.user_id) if @role == "expert"
 
    #メッセージを取り出す。
    @messages = @session.messages

    #空のメッセージのオブジェクトをつくる。
    @post = Message.new
    @post.post_id = @current_user.id
    @post.session_id = @session.id 

    #パスと終了のとき。最新のSessionを取り出す。
    if @status == Settings.pass_status || @status == Settings.end_status

      @last_session = Session.where(:user_id => @current_user.id,:expert_id => @partner.id).last if @role == "user"
      @last_session = Session.where(:user_id => @partner.id,:expert_id => @current_user.id).last if @role == "expert"

      #最新のSessionがパスや終了中ならば、flagをtrueにする。
      @flag = true if @last_session.status == Settings.pass_status || @last_session.status == Settings.end_status
    end


  end


  #コメントを投稿するアクション
  def create

    #メッセージ内容をとりだす。
    @content = params[:message][:content]
    #contentの中身がからだったら、もどる。
    return redirect_to request.env["HTTP_REFERER"] if @content == ""

    @post = Message.new
    @post.attributes = params[:message]

    if @post.save
      
      #5メッセージを超えたらする処理。
      @session = @post.session
      if @session.messages_count == 5
        #ステータスを変える。
        @session.status = Settings.charge_status
        @session.save
      end

      #message/indexに戻る。
      return redirect_to request.env["HTTP_REFERER"]
      
    else

      #エラー処理をする。
      return raise

    end


  end


  #message一覧を表示するためのアクション
  def box
 
    #ユーザーとエキスパートどっちのメッセージのSessionモデルを取り出す。
    @current_user_id = @current_user.id 
   
    #ここに関しては、もう少し効率のいい方法があるかも。SQLを使いすぎている。
    @sessions = Session.where("user_id = ? or expert_id = ?",@current_user_id,@current_user_id)
  
    #メッセージを仮にいれる配列変数 
    @arrMes = []
    #メッセージの配列の最後のオブジェクトを取り出す。
    @sessions.each do |session|
      
      #空の場合は取り除く。
      @arrMes <<  session.messages.last 

    end

    #@arrMesをソートする。idの古い順でソート。
    @messages = @arrMes.sort{|a,b|
      #並びかえる。 
      b.id <=> a.id
    }


  
  end






end
