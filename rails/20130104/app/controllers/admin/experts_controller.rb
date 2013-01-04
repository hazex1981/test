#coding: utf-8
class Admin::ExpertsController < Admin::Base
  
  #エキスパート一覧を表す。  
  def index
 
    #エキスパートのデータを取得
    @experts = User.where(:expert => true)
   
      
  
  
  end

  
  
  def show

    #エキスパートのデータを取得する。
    @expert = User.find_by_id_and_expert(params[:id],true) 
 
    @categories = @expert.categories
 


  end

  
  #エキスパートの新規登録 
  def new
 
    @expert = User.new(:expert => true)
    return raise unless @expert

    #親カテゴリーの情報を得る。
    @parents = Category.find(1).children 

    #ExpertDetailモデルの連結
    @expert.expertdetail = Expertdetail.new



  
  end

  #新規エキスパートを登録する。
  def create
  
    @expert = User.new(:expert => true,:step => 1)
    @expert.image = "http://graph.facebook.com/"+ params[:user][:uid].to_s + "/picture" 
   
    #子モデルのExpertdetailオブジェクトを作成し、親モデルのUserモデルにいれる。
    @expertdetail = Expertdetail.new
    @expertdetail.detail = params[:expertdetail][:detail]
    @expertdetail.price = params[:expertdetail][:price]
    @expertdetail.time = params[:expertdetail][:time]
    @expert.expertdetail = @expertdetail

    #パラメーターをいれる。
    if @expert.update_attributes(params[:user])
  
      #エキスパートの登録画面にいく。
      return redirect_to admin_expert_path(@expert.id)

    else 
      
      #新規登録にもどる。
      return redirect_to new_admin_expert_path 

    end


  end


  #エキスパートの情報を編集
  def edit 

    @expert = User.find_by_id(params[:id])
    return raise unless @expert
    #親カテゴリーの情報を得る。
    @parents = Category.find(1).children 


    #ExpertDetailモデルの連結。Expertdetailがなかったら、生成し、@expertとつなぐ。
    @expert.expertdetail = Expertdetail.new unless @expert.expertdetail



  end


  def update

    @expert = User.find_by_id(params[:id])
    return raise unless @expert
    #ステップ2にしておく。
    @expert.step = 1
    @expert.image = "http://graph.facebook.com/"+ params[:user][:uid].to_s + "/picture" 

    #子モデルのExpertdetailオブジェクトを作成し、親モデルのUserモデルにいれる。
    @expertdetail = Expertdetail.new
    @expertdetail.detail = params[:expertdetail][:detail]
    @expertdetail.price = params[:expertdetail][:price]
    @expertdetail.time = params[:expertdetail][:time]
    @expert.expertdetail = @expertdetail

    #パラメーターをいれる。
    if @expert.update_attributes(params[:user])
  
      #エキスパートの登録画面にいく。
      return redirect_to admin_expert_path(@expert.id)

    else 
     
      #登録編集画面にもどる。
      return redirect_to edit_admin_expert_path(@expert.id)

    end



  end


  def destroy

    @expert = User.find_by_id_and_expert(params[:id],true)    
    return raise unless @expert

    if @expert.destroy
      
      return redirect_to admin_experts_path 

    else

      return raise

    end


  end


  #エキスパート権限を変更する。
  def authchange

    @expert = User.find_by_id_and_expert(params[:id],true)    
    return raise unless @expert

    @expert.toggle(:expert)

    if @expert.save
      #リダイレクトする。
      return redirect_to admin_experts_path

    else
      #エラー処理。
      return raise
    end


  end






end
