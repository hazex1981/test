#coding: utf-8
#adminのcategoriesコントローラー
class Admin::CategoriesController < ApplicationController
  
  #カテゴリー一覧を表示するためのアクション 
  def index
 
    #カテゴリーをすべて取得する。
    @categories = Category.all
    #親カテゴリーをすべて取得する。
    @parents = @categories[0].children

  
  

  end

  #カテゴリー詳細  
  def show
 
    #カテゴリーの情報を取得
    @category = Category.find_by_id(params[:id])
    return raise unless @category

    #このカテゴリーを専門にもつエキスパートの情報を得る。
    @experts = @category.experts
  
  
  
  end

 
  #カテゴリーの新規作成
  def new
  
    @category = Category.new 

    #親カテゴリーのオブジェクトを取得。 
    @parents = Category.find(1).children
    
    @parent_categories = []
    @parents.each do |parent|

      #配列にいれる。
      @parent_categories << [parent.name,parent.id]

    end


  end



  def create

    #親カテゴリーや子カテゴリーなどが空だったらする処理。
    if params[:category][:name].empty? || params[:category][:parent_id].empty?
       
      return redirect_to new_admin_category_path 

    end

    @category = Category.new
    @category.attributes = params[:category]

    if @category.save
      
      #カテゴリーにリダイレクトする。
      return redirect_to admin_categories_path

    else
      #エラー処理。
      return raise

    end


  end


  #カテゴリーの編集
  def edit 

    @category = Category.find_by_id(params[:id])
  
    #親カテゴリーのオブジェクトを取得。 
    @parents = Category.find(1).children
    
    @parent_categories = []
    @parents.each do |parent|

      #配列にいれる。
      @parent_categories << [parent.name,parent.id]

    end



  end

  #アップデート
  def update

    @category = Category.find(params[:id])
    @category.attributes = params[:category]


    #保存する。
    if @category.save
      #カテゴリーの編集画面にうつる。
      return redirect_to admin_category_path(@category.id) 
    
    else
      #エラー処理。
      return raise

    end


  end

  
  def destroy

    @category = Category.find(params[:id])

    #カテゴリーを削除する。
    if @category.destroy
      #カテゴリーのホームにリダイレクト
      return redirect_to admin_categories_path 
    else
      #エラー処理
      return raise
    end


  end

  #削除されたカテゴリーを表示させるアクション
  def deleted

    @delete_array = Category.only_deleted

    #@delete_arrayをソートする。idの古い順でソート。
    @deleted_categories = []
    @deleted_categories = @delete_array.sort{|a,b|
      #並びかえる。 
      a.id <=> b.id
    }




  end


  #削除されたカテゴリーの詳細ページ
  def deleted_category 

    #削除されたカテゴリーを取得
    @deleted_category = Category.only_deleted.find(params[:id]) 
    return raise unless @deleted_category

    #削除されたカテゴリーのtaggingモデルオブジェクト
    @taggings = Tagging.only_deleted.where(:category_id => params[:id])

    #削除カテゴリーのエキスパートをえる。
    @experts = []

    @taggings.each do |tagging|

      @experts << User.find_by_id(tagging.user_id)

    end
    
  end


  #削除されたカテゴリーを復元する。  
  def recover

    @deleted_category = Category.only_deleted.find(params[:id])
  
    if @deleted_category.recover
      #リダイレクトする。
      return redirect_to deleted_admin_categories_path 
    else
      #エラー処理。
      return raise

    end






  end


end
