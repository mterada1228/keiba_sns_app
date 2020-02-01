class Menu < ApplicationRecord
  
  has_many :races, dependent: :destroy
  
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

end
