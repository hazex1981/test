#coding: utf-8
class ExpertsController < ApplicationController
 
  #ログインされてるかどうかを判定する。index以外で行う。
  before_filter :login_required,except: [:name]

  #これは使わない？
  def index


  
 

  end



  #エキスパートの詳細を表示する。
  def show
   
    #エキスパートの情報を取り出す。
    @expert = User.find_by_id_and_expert(params[:id],true)
    #なかったらエラーを表示する。
    return raise ActiveRecord::RecordNotFound unless @expert

  
  
  end

  #名前検索のアクション
  def namesearch


    #ログインされているかの判定をする。
    return redirect_to register_user_path(@current_user.id) if @current_user && @current_user.step == nil
    return redirect_to :login unless @current_user

    #エキスパートのみ取り出す。ログインユーザーの排除
    @experts = User.where(["expert = ? and id != ?", true, @current_user.id])


  end


  #タグ検索のアクション。categoriesコントローラーからアクションがくる。  
  def tag

    
    @selections = params[:category]
    logger.debug(@selections)
    #何も選択してなかったら、categories/indexに戻る。
    return redirect_to :categories unless @selections

    @text1 = ""
    @selections.each do |selection|
      @text1 << selection + ","
    end
    
    @text2 = "("+ @text1.chop! + ")"

    #ここで、ログインユーザーを排除する。エキスパート権限をもってる人限定。
    @sql = "SELECT u.*
            FROM taggings t,users u,categories c 
            WHERE t.category_id  = c.id
            AND (c.id IN"+ @text2 +
            ") AND u.id = t.user_id
            AND u.id = t.user_id
            AND NOT u.id = "+@current_user.id.to_s + 
            " GROUP BY u.id"

    @experts = User.find_by_sql(@sql)
  
  end







end
