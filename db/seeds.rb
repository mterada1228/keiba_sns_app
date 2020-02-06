# 開発環境向けにMenuを生成

Menu.create!(today_date: '2019-12-30')
Menu.create!(today_date: '2019-12-31')
Menu.create!(today_date: '2020-01-01')
Menu.create!(today_date: '2020-01-02')

# 開発機向けにユーザを生成
User.create!(name:  "test1",
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

# 開発環境むけにRaceを生成
menus = Menu.all
# 11R分やる(東京)
11.times do |n|
  place = "東京"
  round = n+1
  race_name = "レース_#{n+1}"
  cource_type = "芝"
  cource_length = 1600
  hose_name1 = "馬名_1"
  hose_name2 = "馬名_2"
  hose_name3 = "馬名_3"
  hose_name4 = "馬名_4"
  hose_name5 = "馬名_5"
  hose_name6 = "馬名_6"
  hose_name7 = "馬名_7"
  hose_name8 = "馬名_8"
  hose_name9 = "馬名_9"
  hose_name10 = "馬名_10"
  hose_name11 = "馬名_11"
  hose_name12 = "馬名_12"
  hose_name13 = "馬名_13"
  hose_name14 = "馬名_14"
  hose_name15 = "馬名_15"
  hose_name16 = "馬名_16"
  hose_name17 = "馬名_17"
  hose_name18 = "馬名_18"
  menus.each { |menu| menu.races.create!(
    place: place,
    round: round,
    race_name: race_name,
    cource_type: cource_type,
    cource_length: cource_length,
    hose_name1: hose_name1,
    hose_name2: hose_name2,
    hose_name3: hose_name3,
    hose_name4: hose_name4,
    hose_name5: hose_name5,
    hose_name6: hose_name6,
    hose_name7: hose_name7,
    hose_name8: hose_name8,
    hose_name9: hose_name9,
    hose_name10: hose_name10,
    hose_name11: hose_name11,
    hose_name12: hose_name12,
    hose_name13: hose_name13,
    hose_name14: hose_name14,
    hose_name15: hose_name15,
    hose_name16: hose_name16,
    hose_name17: hose_name17,
    hose_name18: hose_name18) }
end

# 10R分やる(京都)
10.times do |n|
  place = "京都"
  race_name = "レース_#{n+1}"
  round = n+1
  cource_type = "芝"
  cource_length = 1600
  hose_name1 = "馬名_1"
  hose_name2 = "馬名_2"
  hose_name3 = "馬名_3"
  hose_name4 = "馬名_4"
  hose_name5 = "馬名_5"
  hose_name6 = "馬名_6"
  hose_name7 = "馬名_7"
  hose_name8 = "馬名_8"
  hose_name9 = "馬名_9"
  hose_name10 = "馬名_10"
  hose_name11 = "馬名_11"
  hose_name12 = "馬名_12"
  hose_name13 = "馬名_13"
  hose_name14 = "馬名_14"
  hose_name15 = "馬名_15"
  hose_name16 = "馬名_16"
  hose_name17 = "馬名_17"
  hose_name18 = "馬名_18"
  menus.each { |menu| menu.races.create!(
    place: place,
    round: round,
    race_name: race_name,
    cource_type: cource_type,
    cource_length: cource_length,
    hose_name1: hose_name1,
    hose_name2: hose_name2,
    hose_name3: hose_name3,
    hose_name4: hose_name4,
    hose_name5: hose_name5,
    hose_name6: hose_name6,
    hose_name7: hose_name7,
    hose_name8: hose_name8,
    hose_name9: hose_name9,
    hose_name10: hose_name10,
    hose_name11: hose_name11,
    hose_name12: hose_name12,
    hose_name13: hose_name13,
    hose_name14: hose_name14,
    hose_name15: hose_name15,
    hose_name16: hose_name16,
    hose_name17: hose_name17,
    hose_name18: hose_name18) }
end

# 9R分やる(小倉)
9.times do |n|
  place = "小倉"
  round = n+1
  race_name = "レース_#{n+1}"
  cource_type = "芝"
  cource_length = 1600
  hose_name1 = "馬名_1"
  hose_name2 = "馬名_2"
  hose_name3 = "馬名_3"
  hose_name4 = "馬名_4"
  hose_name5 = "馬名_5"
  hose_name6 = "馬名_6"
  hose_name7 = "馬名_7"
  hose_name8 = "馬名_8"
  hose_name9 = "馬名_9"
  hose_name10 = "馬名_10"
  hose_name11 = "馬名_11"
  hose_name12 = "馬名_12"
  hose_name13 = "馬名_13"
  hose_name14 = "馬名_14"
  hose_name15 = "馬名_15"
  hose_name16 = "馬名_16"
  hose_name17 = "馬名_17"
  hose_name18 = "馬名_18"
  menus.each { |menu| menu.races.create!(
    place: place,
    round: round,
    race_name: race_name,
    cource_type: cource_type,
    cource_length: cource_length,
    hose_name1: hose_name1,
    hose_name2: hose_name2,
    hose_name3: hose_name3,
    hose_name4: hose_name4,
    hose_name5: hose_name5,
    hose_name6: hose_name6,
    hose_name7: hose_name7,
    hose_name8: hose_name8,
    hose_name9: hose_name9,
    hose_name10: hose_name10,
    hose_name11: hose_name11,
    hose_name12: hose_name12,
    hose_name13: hose_name13,
    hose_name14: hose_name14,
    hose_name15: hose_name15,
    hose_name16: hose_name16,
    hose_name17: hose_name17,
    hose_name18: hose_name18) }
end

# 開発機向けにマイクロポストを生成
users = User.all
races = Race.all

5.times do |n|
  races.each do |race|
    users.each { |user| user.microposts.create!(
      content: "予想#{n+1} 場所: #{race.place} ラウンド: #{race.round}",
      race_id: race.id
    )}
  end
end
