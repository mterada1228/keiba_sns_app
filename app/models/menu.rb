class Menu < ApplicationRecord
  
  has_many :races, dependent: :destroy
  attr_accessor :selected_date
  
  # 開催日順にソートして一つ前のMenuを返す
  def previous
    Menu.where("today_date < ?",today_date).order("today_date DESC").first
  end

  # 開催日順にソートして一つ後のMenuを返す
  def next
    Menu.where("today_date > ?",today_date).order("today_date ASC").first
  end
  
  # 当日開催される場名を取得する
  def today_course
    self.races.map(&:place).uniq
  end
  
  # 当日の引数で与えられた場名のレース一覧を取得する
  def today_selected_course_race(course_name)
    self.races.where(place: course_name).order("round ASC")
  end

  # 当日の引数で与えられた場名、ラウンドのレースを取得する
  def get_race(course_name, round)
    self.races.where(place: course_name, round: round).first
  end
  
end
