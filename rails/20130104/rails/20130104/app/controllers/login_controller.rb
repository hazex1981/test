#coding: utf-8
#loginコントローラー。ログインするときなどのコントローラー
class LoginController < ApplicationController

  #applicationコントローラーのauthorizeメソッドは実行しないようにする。
  skip_before_filter :authorize,except: [:index]


  #ログイン
  def index

    #ユーザー登録画面に戻る。
    return redirect_to register_user_path(@current_user.id) if @current_user && @current_user.step == nil

    #expertsのnamesearchにいく。
    return redirect_to :root if @current_user && @current_user.step == 1  

  end


  #Facebookにリダイレクトするためのアクション
  def get

    #リダイレクトurlを取得する。
    @redirect_url = GetObject("get",nil)  
    #facebookにリダイレクトする。
    return redirect_to @redirect_url 
    
  end

  #Facebookから返ってきたときのアクション
  def callback

    #アクセストークンのオブジェクトを取得。
    @access_token = GetObject("callback",params[:code])
    #ユーザーのデータを取得して、@user_data変数に格納する。
    @user_data = @access_token.get("/me/").parsed


    #ここでUserモデルを取得して、データをいれる。
    @user = User.find_or_initialize_by_uid(@user_data["id"])

    #登録をまだしてない場合。
    if @user.step == nil
      @user.name = @user_data["name"]
      @user.email = @user_data["email"]
      @user.image = "http://graph.facebook.com/"+ @user_data["id"] + "/picture"
      @user.bio = @user_data["bio"]
      @user.sex = @user_data["gender"]
      @user.birthday = @user_data["birthday"]

      #@userも保存する。
      if @user.save
        #クッキーを保存する。
        cookies.signed[:user_id] ={ value: @user.id ,expires: 30.days.from_now }  
        #登録画面にリダイレクトする。
        return redirect_to register_user_path(@user.id) 
        
      else
        #保存されなかった場合、エラー処理を行う。
        raise
        return
      end

    elsif
      #クッキーを保存する。
      cookies.signed[:user_id] ={ value: @user.id ,expires: 30.days.from_now }  
      #idが2のjiroで入る。
      #cookies.signed[:user_id] ={ value: 2 ,expires: 30.days.from_now }  
      #idが4のtakuで入る。
      #cookies.signed[:user_id] ={ value: 4 ,expires: 30.days.from_now }  
      #idが7のjinで入る。
      #cookies.signed[:user_id] ={ value: 7 ,expires: 30.days.from_now }  
      
      #登録がすんでる場合の処理。
      return redirect_to :root
    end




  end

  
  #何らかのオブジェクトを返すメソッド。いろいろなoauthオブジェクトなど内部で作成
  def GetObject(pattern,param)

    #oauthクラスをつくるための変数
    @app_id = Settings.APPID
    @app_secret = Settings.APPSECRET 
    @args = {:site => 'https://graph.facebook.com', :token_url => '/oauth/access_token', :ssl => { :verify => false } }

    #OAuth2::Clientオブジェクトを取得
    @client = OAuth2::Client.new( @app_id ,@app_secret, @args) 
    @callback_url = url_for(:controller => "login",:action => "callback")

    if pattern == "get"
      #メールアドレスを取得するために、スコープに"email"をいれる。
      return @client.auth_code.authorize_url(:redirect_uri => @callback_url,:scope => "email,user_birthday" )
    elsif pattern == "callback"
      #フォーマットを決める。
      @header_format = 'OAuth %s'
      return @client.auth_code.get_token(param, {:redirect_uri => @callback_url,
      :parse => :query} ,{:header_format => @header_format})
    end

  end














end
