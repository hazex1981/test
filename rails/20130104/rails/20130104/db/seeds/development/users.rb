# coding: utf-8
#エキスパートのシードデータを埋めるためのファイル

#カテゴリーのオブジェクトの変数をつくる。
categories = Category.all

#FIELD。66項目
@fields = categories[0].children[0].children

#SKILL。20項目
@skills = categories[0].children[1].children

#JOB。27項目
@jobs = categories[0].children[2].children

#AREA。9項目
@areas = categories[0].children[3].children


#エキスパートを10人つくる。適当に項目をいれていく。

#エキスパート1
@expert1 = User.find_or_initialize_by_uid("kei.sakamoto0609")
@expert1.name = "坂本 慧"
@expert1.email = "kei.sakamoto0609@gmail.com"
@expert1.image = "http://graph.facebook.com/kei.sakamoto0609/picture"
@expert1.sex = "male"
@expert1.birthday = "06/09/1985"
@expert1.bio = ""
@expert1.expert = true
@expert1.step = 1

#ここからexpertdetailモデル
@expertdetail1 = Expertdetail.new
@expertdetail1.detail = "株式会社ホリプロ
　スポーツ文化部
　（担当）西川史子,飯星景子,鴻上尚史

　兼務
　　WEB戦略室、WEB戦略部
　　第３５回ホリプロタレントスカウトキャラバン実行委員　（グランプリ：安田聖愛　http://horipro.co.jp/talent/PF126/）
↓
ITベンチャーに転職
Google Adwords　認定資格（検索広告）　取得
↓
2012年11月　起業　株式会社エモーシブ設立

2012年12月　インキュベイトファンドより投資採択決定"
@expertdetail1.price = "2000円 ／ 5メッセージ"
@expertdetail1.time = "水ー木：20:00–21:00なら比較的早く返信可能です。 それ以外は、通常24時間以内に返信させていただきます。"
@expertdetail1.inspect
@expert1.expertdetail = @expertdetail1

@expert1.save

@fields[21].experts << @expert1
@fields[50].experts << @expert1
@fields[65].experts << @expert1
@skills[20].experts << @expert1


#エキスパート2
@expert2 = User.find_or_initialize_by_uid("satoshimmyo")
@expert2.name = "新明 智"
@expert2.email = "satoshimmyo@gmail.com"
@expert2.image = "http://graph.facebook.com/satoshimmyo/picture"
@expert2.sex = "male"
@expert2.birthday = "05/07/1982"
@expert2.bio = ""
@expert2.expert = true
@expert2.step = 1

#ここからexpertdetailモデル
@expertdetail2 = Expertdetail.new
@expertdetail2.detail = "1982年生まれ、慶應義塾大学卒業後、大手ITベンダー、独立系ITコンサルティング会社の設立メンバーを経て、株式会社ウェルセルフを共同創業。
一人ひとりが自分のストーリーを生きていく社会を作るというビジョンのもと、ココナラという「得意（経験・知識・スキル）」を500円で売買できるサイトをローンチ。スキルマーケットをredesign、新しいマーケットを作るために現在奮闘中。
http://coconala.com/

興味があるのは認知科学、デザイン周り。UIデザインを得意としています。"
@expertdetail2.price = "2000円 ／ 5メッセージ"
@expertdetail2.time = "いつでも。ただし反応は遅いです。"
@expert2.expertdetail = @expertdetail2

@expert2.save

@skills[17].experts << @expert2
@skills[18].experts << @expert2
@skills[19].experts << @expert2
@jobs[6].experts << @expert2
@jobs[7].experts << @expert2
@jobs[11].experts << @expert2
@jobs[12].experts << @expert2


#エキスパート3
@expert3 = User.find_or_initialize_by_uid("fuyuhiko.satou")
@expert3.name = "Fuyuhiko Satou"
@expert3.email = "fuyuhiko.satou@gmail.com"
@expert3.image = "http://graph.facebook.com/fuyuhiko.satou/picture"
@expert3.sex = "male"
@expert3.birthday = "00/00/1981"
@expert3.bio = ""
@expert3.expert = true
@expert3.step = 1

#ここからexpertdetailモデル
@expertdetail3 = Expertdetail.new
@expertdetail3.detail = "ベンチャー企業でIT責任者として働いています。
最近、顧客DB＋メール配信システムをSaaSで提供する事業をスタートさせました。（立ち上げ6か月で13社に導入いただいてます！）"
@expertdetail3.price = "2000円 ／ 5メッセージ"
@expertdetail3.time = "平日：22:00以降、土日：12:00ー18:00　で対応します。"
@expert3.expertdetail = @expertdetail3

@expert3.save

@fields[69].experts << @expert3
@skills[15].experts << @expert3
@skills[23].experts << @expert3
@jobs[23].experts << @expert3

#エキスパート4
@expert4 = User.find_or_initialize_by_uid("yamada.etsuo")
@expert4.name = "山田 悦朗"
@expert4.email = "yamada.etsuo@gmail.com"
@expert4.image = "http://graph.facebook.com/yamada.etsuo/picture"
@expert4.sex = "male"
@expert4.birthday = "00/00/1971"
@expert4.bio = ""
@expert4.expert = true

#ここからexpertdetailモデル
@expertdetail4 = Expertdetail.new
@expertdetail4.detail = "PMP / CSM / CSPO。ＩＴコンサルやってます。/株式会社豆蔵"
@expertdetail4.price = "2000円 ／ 5メッセージ"
@expertdetail4.time = "平日は基本対応できませんが、土–日の8:00ー22:00で対応できます。
対応できない場合は、ノーメッセージでパスさせていただく場合がありますので、ご承知ください。"
@expert4.expertdetail = @expertdetail4

@expert4.step = 1
@expert4.save

@skills[21].experts << @expert4
@skills[22].experts << @expert4
@skills[11].experts << @expert4
@skills[23].experts << @expert4
@jobs[11].experts << @expert4


#エキスパート5
@expert5 = User.find_or_initialize_by_uid("toshiyuki.tsurumi")
@expert5.name = "靎見 敏行"
@expert5.email = "toshiyuki.tsurumi@gmail.com"
@expert5.image = "http://graph.facebook.com/toshiyuki.tsurumi/picture"
@expert5.sex = "male"
@expert5.birthday = "08/23/1982"
@expert5.bio = ""
@expert5.expert = true
@expert5.step = 1

#ここからexpertdetailモデル
@expertdetail5 = Expertdetail.new
@expertdetail5.detail = "日本アイ・ビー・エム⇒Nefrock inc. 開発コンサル・相談乗ります"
@expertdetail5.price = "2000円 ／ 5メッセージ"
@expertdetail5.time = "月-金：23:00ー25:00頃
本業での仕事が忙しい場合は、パスさせていただきます。"
@expert5.expertdetail = @expertdetail5

@expert5.save

@fields[50].experts << @expert5
@fields[51].experts << @expert5
@jobs[24].experts << @expert5
@skills[23].experts << @expert5
@skills[24].experts << @expert5



#エキスパート6
@expert6 = User.find_or_initialize_by_uid("masahiko.honma")
@expert6.name = "Masahiko Honma"
@expert6.email = "masahiko.honma@gmail.com"
@expert6.image = "http://graph.facebook.com/masahiko.honma/picture"
@expert6.sex = "male"
@expert6.birthday = "01/15/1975"
@expert6.bio = ""
@expert6.expert = true
@expert6.step = 1

#ここからexpertdetailモデル
@expertdetail6 = Expertdetail.new
@expertdetail6.detail = "ソーシャル及びモバイルアプリやゲームに特化したベンチャーファンドである、インキュベイトファンドの創業者兼代表パートナー。シードステージに特化したベンチャーファンド、コアピープルパートナーズ、創業者兼代表パートナー。

主な投資先企業は、ポケラボ(創業者、取締役2012年退任)、gumi（取締役。2011年退任）、エフルート(現アクセルマーク)、みんなのウェディング（監査役）、チケットストリート（取締役）MUGENUP等。IPO実績として、株式会社MonotaRO、株式会社ベンチャーリパブリック。"
@expertdetail6.price = "2000円 ／ 5メッセージ"
@expertdetail6.time = "24時間中に回答可能か、パスさせていただくかご連絡します。
日本⇔シンガポールでの移動をしている日は、遅くなる場合もあります。"
@expert6.expertdetail = @expertdetail6

@expert6.save

@jobs[1].experts << @expert6
@areas[4].experts << @expert6
@fields[50].experts << @expert6
@fields[51].experts << @expert6
@skills[25].experts << @expert6




#エキスパート7
@expert7 = User.find_or_initialize_by_uid("wada.keisuke")
@expert7.name = "和田 圭祐"
@expert7.email = "wada.keisuke@gmail.com"
@expert7.image = "http://graph.facebook.com/wada.keisuke/picture"
@expert7.sex = "male"
@expert7.birthday = "12/28/1981"
@expert7.bio = ""
@expert7.expert = true
@expert7.step = 1

#ここからexpertdetailモデル
@expertdetail7 = Expertdetail.new
@expertdetail7.detail = "incubateFund,Co-Founder,GeneralPartner"
@expertdetail7.price = "2000円 ／ 5メッセージ"
@expertdetail7.time = "VCへの興味がある起業家の方へのメッセージはこちらに集約しています。
基本的に3ー4日でご連絡します。このサービス内でのやり取りでの守秘義務契約等は、結べませんのでご了承ください。"
@expert7.expertdetail = @expertdetail7

@expert7.save

@areas[6].experts << @expert7
@fields[1].experts << @expert7
@fields[3].experts << @expert7
@fields[20].experts << @expert7
@jobs[14].experts << @expert7
@jobs[18].experts << @expert7
@skills[4].experts << @expert7
@skills[5].experts << @expert7




#エキスパート8
@expert8 = User.find_or_initialize_by_uid("akirahrkw")
@expert8.name = "Akira Hirakawa"
@expert8.email = "akirahrkw@gmail.com"
@expert8.image = "http://graph.facebook.com/akirahrkw/picture"
@expert8.sex = "male"
@expert8.birthday = "00/00/1983"
@expert8.bio = ""
@expert8.expert = true
@expert8.step = 1

#ここからexpertdetailモデル
@expertdetail8 = Expertdetail.new
@expertdetail8.detail = "休日フリーランスプログラマです。シンガポールでスタートアップ2社目。海外でのエンジニアとしての働き方等お話しできます。

Burpple Lead Engineer · シンガポール · 2012年8月から現在
urbancook 起業家 · シンガポール · 2011年7月〜2012年6月
株式会社サイバーエージェント [CyberAgent]
Software Engineer · 東京都渋谷区 · 2006年9月〜2009年2月 Ameba"
@expertdetail8.price = "1000円 ／ 5メッセージ"
@expertdetail8.time = "土日は対応できます。"
@expert8.expertdetail = @expertdetail8

@expert8.save

@areas[4].experts << @expert8
@fields[50].experts << @expert8
@skills[23].experts << @expert8
@skills[24].experts << @expert8
@jobs[10].experts << @expert8
@jobs[25].experts << @expert8



#エキスパート9
@expert9 = User.find_or_initialize_by_uid("kazuhiro0607")
@expert9.name = "岩田 和宏"
@expert9.email = "kazuhiro0607@gmail.com"
@expert9.image = "http://graph.facebook.com/kazuhiro0607/picture"
@expert9.sex = "male"
@expert9.birthday = "06/07/1979"
@expert9.bio = ""
@expert9.expert = true
@expert9.step = 1

#ここからexpertdetailモデル
@expertdetail9 = Expertdetail.new
@expertdetail9.detail = "Koozyt, Inc. →　株mixi → 株式会社コニット　個人やプロジェクトベースでサービス開発を多く支援。"
@expertdetail9.price = "2000円 ／ 5メッセージ"
@expertdetail9.time = "本業の開発が厳しい時以外は、対応可能です."
@expert9.expertdetail = @expertdetail19

@expert9.save


@fields[50].experts << @expert9
@jobs[10].experts << @expert9
@jobs[25].experts << @expert9
@jobs[24].experts << @expert9
@skills[23].experts << @expert9



#エキスパート10
@expert10 = User.find_or_initialize_by_uid("yoshifumisato0521")
@expert10.name = "佐藤 佳文"
@expert10.email = "yoshifumisato0521@gmail.com"
@expert10.image = "http://graph.facebook.com/yoshifumisato0521/picture"
@expert10.sex = "male"
@expert10.birthday = "05/21/1989"
@expert10.bio = ""
@expert10.expert = true
@expert10.admin = true
@expert10.step = 1

#ここからexpertdetailモデル
@expertdetail10 = Expertdetail.new
@expertdetail10.detail = "最近、小さい会社で、プログラマーをやりはじめる。結構大きい案件に携わらせてもらい、毎日充実した時間を過ごす。
そこでは、Flashのプログラマーをやっていた。

ほかの会社では、サーバーサイドエンジニアとしてインターン。
また、HTML5のオープンソースのライブラリの開発チームにも所属していた。

また、電通インターンに参加して、広告コミュニケーションにも興味があり、テクノロジーをふんだんに活かしたプロモーションとかをすごくやりたいと思っている。

最近applimというマーケティングコンテストで優勝。
詳細→http://www.advertimes.com/20121106/article92667/?utm_source=dlvr.it&utm_medium=facebook
"
@expertdetail10.price = "2000円 ／ 5メッセージ"
@expertdetail10.time = "特にありません"
@expert10.expertdetail = @expertdetail10

@expert10.save

@jobs[10].experts << @expert10
@jobs[25].experts << @expert10
@jobs[24].experts << @expert10
@skills[23].experts << @expert10

#エキスパート11
@expert11 = User.find_or_initialize_by_uid("100000406350451")
@expert11.name = "Yoshitaka Hazeyama"
@expert11.email = "hazex0202@gmail.com"
@expert11.image = "http://graph.facebook.com/100000406350451/picture"
@expert11.sex = "male"
@expert11.birthday = "02/2/1981"
@expert11.bio = ""
@expert11.expert = true
@expert11.step = 1
@expert11.admin = true

#ここからexpertdetailモデル
@expertdetail11 = Expertdetail.new
@expertdetail11.detail = "株式会社ミスミにて、商品企画/立上げ、事業企画/立上げ、ECサイト企画/立上げと企画立上げ業務を専任。主にユーザーインタビューを首都したサービスの企画・市場調査がスキル"
@expertdetail11.price = "2000円 ／ 5メッセージ"
@expertdetail11.time = "いつでも。ただし反応は遅いです。"
@expert11.expertdetail = @expertdetail11

@expert11.save

@fields[29].experts << @expert11
@fields[31].experts << @expert11
@fields[50].experts << @expert11
@fields[55].experts << @expert11
@skills[19].experts << @expert11

@jobs[10].experts << @expert11
@jobs[12].experts << @expert11

@jobs[15].experts << @expert11

@jobs[20].experts << @expert11



