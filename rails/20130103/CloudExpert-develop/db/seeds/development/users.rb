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
@expert1 = User.find_or_initialize_by_uid("1")
@expert1.name = "taro"
@expert1.email = "taro@gmail.com"
@expert1.image = "satoshimmyo"
@expert1.sex = "male"
@expert1.birthday = "05/07/1982"
@expert1.bio = "私の名前は、taroです"
@expert1.expert = true
@expert1.step = 1
@expert1.save

@fields[4].experts << @expert1
@fields[5].experts << @expert1
@fields[7].experts << @expert1
@jobs[20].experts << @expert1


#エキスパート2
@expert2 = User.find_or_initialize_by_uid("satoshimmyo")
@expert2.name = "新明 智"
@expert2.email = "test@gmail.com"
@expert2.image = "satoshimmyo"
@expert2.sex = "male"
@expert2.birthday = "05/07/1982"
@expert2.bio = "1982年生まれ、慶應義塾大学卒業後、大手ITベンダー、独立系ITコンサルティング会社の設立メンバーを経て、株式会社ウェルセルフを共同創業。
一人ひとりが自分のストーリーを生きていく社会を作るというビジョンのもと、ココナラという「得意（経験・知識・スキル）」を500円で売買できるサイトをローンチ。スキルマーケットをredesign、新しいマーケットを作るために現在奮闘中。
http://coconala.com/

興味があるのは認知科学、デザイン周り。UIデザインを得意としています。"
@expert2.expert = true
@expert2.step = 1
@expert2.save

@skills[17].experts << @expert2
@skills[18].experts << @expert2
@skills[19].experts << @expert2
@jobs[6].experts << @expert2
@jobs[7].experts << @expert2
@jobs[11].experts << @expert2
@jobs[12].experts << @expert2


#エキスパート3
@expert3 = User.find_or_initialize_by_uid("3")
@expert3.name = "gaku"
@expert3.email = "gaku@gmail.com"
@expert3.image = "gaku.jpg"
@expert3.sex = "male"
@expert3.birthday = "12/24/1988"
@expert3.bio = "私の名前は、gakuです"
@expert3.expert = true
@expert3.step = 1
@expert3.save

@areas[2].experts << @expert3
@fields[40].experts << @expert3
@fields[45].experts << @expert3
@jobs[10].experts << @expert3
@jobs[12].experts << @expert3
@skills[15].experts << @expert3



#エキスパート4
@expert4 = User.find_or_initialize_by_uid("4")
@expert4.name = "taku"
@expert4.email = "taku@gmail.com"
@expert4.image = "taku.jpg"
@expert4.sex = "male"
@expert4.birthday = "08/12/1976"
@expert4.bio = "私の名前は、takuです"
@expert4.expert = true
@expert4.step = 1
@expert4.save

@areas[1].experts << @expert4
@fields[2].experts << @expert4
@fields[3].experts << @expert4
@jobs[3].experts << @expert4
@jobs[4].experts << @expert4
@skills[13].experts << @expert4
@skills[12].experts << @expert4



#エキスパート5
@expert5 = User.find_or_initialize_by_uid("5")
@expert5.name = "mika"
@expert5.email = "mika@gmail.com"
@expert5.image = "mika.jpg"
@expert5.sex = "femail"
@expert5.birthday = "01/28/1976"
@expert5.bio = "私の名前は、mikaです"
@expert5.expert = true
@expert5.step = 1
@expert5.save

@areas[3].experts << @expert5
@fields[50].experts << @expert5
@fields[45].experts << @expert5
@fields[34].experts << @expert5
@jobs[16].experts << @expert5
@jobs[17].experts << @expert5
@skills[3].experts << @expert5
@skills[18].experts << @expert5



#エキスパート6
@expert6 = User.find_or_initialize_by_uid("6")
@expert6.name = "tomo"
@expert6.email = "tomo@gmail.com"
@expert6.image = "tomo.jpg"
@expert6.sex = "male"
@expert6.birthday = "03/03/1989"
@expert6.bio = "私の名前は、tomoです"
@expert6.expert = true
@expert6.step = 1
@expert6.save

@areas[7].experts << @expert6
@fields[14].experts << @expert6
@fields[21].experts << @expert6
@fields[20].experts << @expert6
@jobs[1].experts << @expert6
@jobs[2].experts << @expert6
@skills[1].experts << @expert6
@skills[16].experts << @expert6




#エキスパート7
@expert7 = User.find_or_initialize_by_uid("7")
@expert7.name = "jin"
@expert7.email = "jin@gmail.com"
@expert7.image = "jin.jpg"
@expert7.sex = "male"
@expert7.birthday = "09/01/1967"
@expert7.bio = "私の名前はjinです"
@expert7.expert = true
@expert7.step = 1
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
@expert8 = User.find_or_initialize_by_uid("8")
@expert8.name = "akira"
@expert8.email = "akira@gmail.com"
@expert8.image = "akira.jpg"
@expert8.sex = "male"
@expert8.birthday = "02/23/2000"
@expert8.bio = "私の名前は、akiraです"
@expert8.expert = true
@expert8.step = 1
@expert8.save

@areas[4].experts << @expert8
@fields[50].experts << @expert8
@fields[51].experts << @expert8
@fields[59].experts << @expert8
@jobs[4].experts << @expert8
@jobs[9].experts << @expert8
@skills[16].experts << @expert8
@skills[17].experts << @expert8



#エキスパート9
@expert9 = User.find_or_initialize_by_uid("9")
@expert9.name = "yuki"
@expert9.email = "yuki@gmail.com"
@expert9.image = "yuki.jpg"
@expert9.sex = "female"
@expert9.birthday = "04/01/1979"
@expert9.bio = "私の名前はyukiです。"
@expert9.expert = true
@expert9.step = 1
@expert9.save

@areas[6].experts << @expert9
@fields[46].experts << @expert9
@fields[47].experts << @expert9
@fields[60].experts << @expert9
@jobs[3].experts << @expert9
@jobs[19].experts << @expert8
@skills[4].experts << @expert9
@skills[8].experts << @expert9



#エキスパート10
@expert10 = User.find_or_initialize_by_uid("10")
@expert10.name = "aiko"
@expert10.email = "aiko@gmail.com"
@expert10.image = "aiko.jpg"
@expert10.sex = "female"
@expert10.birthday = "08/13/1965"
@expert10.bio = "私の名前はaikoです"
@expert10.expert = true
@expert10.step = 1
@expert10.save

@areas[3].experts << @expert10
@fields[30].experts << @expert10
@fields[32].experts << @expert10
@fields[39].experts << @expert10
@jobs[15].experts << @expert10
@jobs[16].experts << @expert10
@skills[2].experts << @expert10
@skills[12].experts << @expert10

#エキスパート11
@expert11 = User.find_or_initialize_by_uid("100000406350451")
@expert11.name = "Yoshitaka Hazeyama"
@expert11.email = "hazex0202@gmail.com"
@expert11.image = "http://graph.facebook.com/100000406350451/picture"
@expert11.sex = "male"
@expert11.birthday = "02/2/1981"
@expert11.bio = "株式会社ミスミにて、商品企画/立上げ、事業企画/立上げ、ECサイト企画/立上げと企画立上げ業務を専任。主にユーザーインタビューを首都したサービスの企画・市場調査がスキル"
@expert11.expert = true
@expert11.step = 1
@expert11.admin = true
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




