# coding: utf-8

#カテゴリーのシードデータを埋めるためのファイル

#上位階層のデータ
@TopOfcategories = Category.find_or_initialize_by_name("全ジャンル")
@TopOfcategories.parent_id = nil
@TopOfcategories.save




# ① FIELDというジャンルをつくる。
@topoffields = Category.find_or_initialize_by_name("FIELD")
@topoffields.parent_id = @TopOfcategories.id 
@topoffields.save


#FIELDというジャンルの項目をいれる。
fields = %w(食品 タバコ 試料   食料  医薬品 化粧品 医療用品    化学工業品   石油  石炭
            プラスチック製品    ゴム  セラミック製品 鉄鋼  非金属 金属製品    武器  木材  紙加工品    生活雑貨
            家具  ファッション  宝飾品 アクセサリ   文具  玩具  スポーツ用品  楽器  一般機械    機械部品
            金型  産業用機械   事務機器    サービス用機器 電気機器    電池  記録媒体    情報  通信  AV機器
            半導体 電子部品    自動車 輸送用機器   精密機器    光学機器    レンズ その他商品   メーカー    情報通信
            インターネット コンサルティング   リサーチ 人材関連    総合商社    専門商社    小売  飲食娯楽店 旅行
            教育  学習支援    医療  福祉  広告  出版  エンターテイメント   コンサルティング    調査  官公庁
            公共機関    B２B B２C 小売  消費者サービス シンクタンク  会計事務所   ソフトウェアハウス   通信キャリア
            店舗・FC開発 消費者サービス  医療  福祉  公共サービス 建設 不動産  金融  保険 運輸
            10名以下   11～100名 101～1000名   1001～5000名  5001名以上)
#ループでまわす。
fields.each do |field|
  f = Category.find_or_initialize_by_name(field)
  f.parent_id = @topoffields.id
  f.save
end





# ②　SKILLというジャンルをつくる。
@topofskills = Category.find_or_initialize_by_name("SKILL")
@topofskills.parent_id = @TopOfcategories.id
@topofskills.save

#SKILLというジャンルに項目をいれる。
skills = %w(
            成長戦略    M&A・アライアンス対策    組織改革    オペレーション 会計・税務   マーケティング システム    商品企画・開発 ユーザーリレーション
            ERP SCM SFA・データマイニング    アプリケーションサーバ ストレージ管理 統合運用管理  グループウェア RDBMS   UXデザイン  UIデザイン
            サービスコンセプト設計 ユーザーインタビュー)

skills.each do |skill|
  s = Category.find_or_initialize_by_name(skill)
  s.parent_id = @topofskills.id
  s.save
end




# ③　JOBというジャンルをつくる。
@topofjobs = Category.find_or_initialize_by_name("JOB")
@topofjobs.parent_id = @TopOfcategories.id
@topofjobs.save

#JOBをいうジャンルの項目をいれる。
jobs = %w(
          VC    採用  採用方針    給与システム開発    評価システム開発    市場分析    ユーザーインタビュー  商品企画    営業  媒体作成
          スタートアップ   コンサルタント   リサーチャー    システムインテグレーター    ネットワークインテグレーター  商品企画・マーケティング    営業企画・販売促進   広告宣伝    購買
          物流企画  事業企画    マーチャンダイジング  バイイング   プロジェクトマネジャー アプリケーションエンジニア   インフラエンジニア   組込系ソフトウェア開発 Web・アプリケーション開発
          組込系ソフトウェア開発   パッケージソフト・ミドルウェア開発   通信ネットワーク設計・構築   運用  監視  テクニカルサポート   保守  社内情報システム    あMIS)


jobs.each do |job|
  j = Category.find_or_initialize_by_name(job)
  j.parent_id = @topofjobs.id
  j.save
end




#　④　AREAというジャンルをつくる。
@topofareas = Category.find_or_initialize_by_name("AREA")
@topofareas.parent_id = @TopOfcategories.id
@topofareas.save

#AREAというジャンルの項目をいれる。
areas = %w(北米地域 南米地域 中国 東アジア地域（韓国･台湾等） 東南アジア地域 欧州地域 大洋州地域 中東地域 アフリカ地域)
areas.each do |area|
  a = Category.find_or_initialize_by_name(area)
  a.parent_id = @topofareas.id
  a.save
end


































