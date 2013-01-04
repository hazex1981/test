#coding: utf-8
class CategoriesController < ApplicationController

  #ログインされてるかどうかを判定する。index以外で行う。
  before_filter :login_required


  def index

    #カテゴリーをすべて取得する。
    @categories = Category.all
    #親カテゴリーをすべて取得する。
    @parents = @categories[0].children

  
  end
















end
