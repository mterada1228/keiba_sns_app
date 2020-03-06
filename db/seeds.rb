# 開発環境向けにMenuを生成

Menu.create!(today_date: '2019-12-21')
Menu.create!(today_date: '2019-12-22')

# 開発機向けにユーザを生成
User.create!(name:  "",
             email: "test1@co.jp",
             password:              "aaaaaa",
             password_confirmation: "aaaaaa")

User.create!(name:  "test2",
             email: "test2@co.jp",
             password:              "aaaaaa",
             password_confirmation: "aaaaaa")

User.create!(name:  "test3",
             email: "test3@co.jp",
             password:              "aaaaaa",
             password_confirmation: "aaaaaa")

# リレーションシップ
users = User.all
user  = users.first
user.follow(users[1])
user.follow(users[2])
users[1].follow(user)
users[2].follow(user)

# 開発環境むけにRaceを生成
menus = Menu.all

hose1_name = "test1"
hose1_gate_number = 1
hose1_gate_color = "white"
hose1_number = 1

hose2_name = "test2"
hose2_gate_number = 1
hose2_gate_color = "white"
hose2_number = 2

hose3_name = "test3"
hose3_gate_number = 2
hose3_gate_color = "black"
hose3_number = 3

hose4_name = "test4"
hose4_gate_number = 2
hose4_gate_color = "black"
hose4_number = 4

# 4R分やる(東京)
4.times do |n|
  place = "東京"
  round = n+1
  race_name = "レース_#{n+1}"
  cource_type = "芝"
  cource_length = 1600
  menus.each { |menu| menu.races.create!(
    place: place,
    round: round,
    race_name: race_name,
    cource_type: cource_type,
    cource_length: cource_length,
    hose1_name: hose1_name, 
    hose1_gate_number: hose1_gate_number,
    hose1_gate_color: hose1_gate_color,
    hose1_number: hose1_number,
    hose2_name: hose2_name, 
    hose2_gate_number: hose2_gate_number,
    hose2_gate_color: hose2_gate_color,
    hose2_number: hose2_number,
    hose3_name: hose3_name, 
    hose3_gate_number: hose3_gate_number,
    hose3_gate_color: hose3_gate_color,
    hose3_number: hose3_number,
    hose4_name: hose4_name, 
    hose4_gate_number: hose4_gate_number,
    hose4_gate_color: hose4_gate_color,
    hose4_number: hose4_number
    ) }
end

# 3R分やる(京都)
3.times do |n|
  place = "京都"
  race_name = "レース_#{n+1}"
  round = n+1
  cource_type = "芝"
  cource_length = 1600
  menus.each { |menu| menu.races.create!(
    place: place,
    round: round,
    race_name: race_name,
    cource_type: cource_type,
    cource_length: cource_length,
    hose1_name: hose1_name, 
    hose1_gate_number: hose1_gate_number,
    hose1_gate_color: hose1_gate_color,
    hose1_number: hose1_number,
    hose2_name: hose2_name, 
    hose2_gate_number: hose2_gate_number,
    hose2_gate_color: hose2_gate_color,
    hose2_number: hose2_number,
    hose3_name: hose3_name, 
    hose3_gate_number: hose3_gate_number,
    hose3_gate_color: hose3_gate_color,
    hose3_number: hose3_number,
    hose4_name: hose4_name, 
    hose4_gate_number: hose4_gate_number,
    hose4_gate_color: hose4_gate_color,
    hose4_number: hose4_number
    ) }
end

# 2R分やる(小倉)
2.times do |n|
  place = "小倉"
  round = n+1
  race_name = "レース_#{n+1}"
  cource_type = "芝"
  cource_length = 1600
  menus.each { |menu| menu.races.create!(
    place: place,
    round: round,
    race_name: race_name,
    cource_type: cource_type,
    cource_length: cource_length,
    hose1_name: hose1_name, 
    hose1_gate_number: hose1_gate_number,
    hose1_gate_color: hose1_gate_color,
    hose1_number: hose1_number,
    hose2_name: hose2_name, 
    hose2_gate_number: hose2_gate_number,
    hose2_gate_color: hose2_gate_color,
    hose2_number: hose2_number,
    hose3_name: hose3_name, 
    hose3_gate_number: hose3_gate_number,
    hose3_gate_color: hose3_gate_color,
    hose3_number: hose3_number,
    hose4_name: hose4_name, 
    hose4_gate_number: hose4_gate_number,
    hose4_gate_color: hose4_gate_color,
    hose4_number: hose4_number
    ) }
end

# 開発機向けにマイクロポストを生成
users = User.all
races = Race.all

5.times do |n|
  races.each do |race|
    users.each { |user| user.microposts.create!(
      content: "予想#{n+1} 場所: #{race.place} ラウンド: #{race.round}",
      race_id: race.id, 
      activated: true
    )}
  end
end

# 馬印を生成
microposts = Micropost.all

microposts.each { |micropost| micropost.build_hosemark(
  hose1_mark: '◎',
  hose3_mark: '◯',
  hose5_mark: '▲'
).save }

# 買い目を生成
microposts = Micropost.all

microposts.each do |micropost| 
  micropost.kaimes.build(baken_type: '単勝', first_hoses: '1', betting: '100').save
  micropost.kaimes.build(baken_type: '馬連', buy_type: 'ながし', first_hoses: '1', second_hoses: '2, 3', betting: '100').save
  micropost.kaimes.build(baken_type: '三連単', buy_type: 'ながし', first_hoses: '1', second_hoses: '2, 3', third_hoses: '2, 3', betting: '100').save
end

# リプライを生成

user  = users.first
race = Race.first
reply_mic =  user.microposts.create!(content: "リプライコメントです", race_id: race.id, activated: true)
replied_posts = Micropost.all

replied_posts.each do |replied_post|
  replied_post.replied(reply_mic)
end

