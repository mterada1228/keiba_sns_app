class Race < ApplicationRecord
  # 依存関係
  belongs_to :menu
  has_many :microposts, dependent: :destroy
end
