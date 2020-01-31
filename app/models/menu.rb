class Menu < ApplicationRecord
  
  # today_dateの新しい順でソートする
  default_scope -> { order(today_date: :desc) }

end
