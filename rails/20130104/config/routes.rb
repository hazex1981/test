#coding: utf-8
#ルーティング
CloudExpert::Application.routes.draw do
 
  #ルートの設定。
  root :to => "experts#namesearch"
  
  #ログイン画面のルーティング
  get "login/index",:as => "login"

  #Facebook認証のルーティング
  get "login/get",:as => "oauth"
  get "login/callback" 


  #usersコントローラーのリソースをルーティングをする。
  resources :users,only: [] do

    member do
      #ユーザー登録のアクション
      get "register"
      put "registered"
      #ユーザーの個人情報のアクション
      get "profile" 
    end

  end
  
  #categoriesコントローラーのリソースをルーティングをする。
  resources :categories,only: [:index] 

  #expertコントローラーのリソース。
  resources :experts,only: [:index,:show] do
  
    collection do
      #タグ検索のアクション
      get "tag"
      #名前検索のアクション
      get "namesearch"
    end
  
  end

  
  #sessionsコントローラーのリソース。ここに、messageリソースをネストする。
  resources :sessions,only: [:new,:create] do

    #memberリソースへ追加アクション
    member do
      post "pass"
      post "end"
    end

    collection do
      #divideアクション
      get "divide"
    end

    resources :messages,only: [:index,:create] 

  end


  #messagesのリソース。
  resources :messages,only: [] do

    collection do
      get "box"
    end

  end

  #adminの名前空間
  namespace :admin do

    root to: "top#index"

    resources :users,only: [:index,:show] do

      member do
        post "authchange"
      end


    end

    resources :experts do

      member do

        post "authchange"

      end

    end

    resources :categories do 

      collection do
        #削除された項目のリストのアクション
        get "deleted"
      end

      member do
        #削除された項目の詳細
        get "deleted_category"
        post "recover"

      end


    end

  end











  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
