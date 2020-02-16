class Micropost < ApplicationRecord
  
  # 各テーブルとの依存関係を定義する
  belongs_to :user, dependent: :destroy
  belongs_to :race, dependent: :destroy
  has_one :hosemark
  has_many :kaimes
  accepts_nested_attributes_for :hosemark
  accepts_nested_attributes_for :kaimes
  
  # created_at の 降順（DESC）で並び替える
  default_scope -> { order(created_at: :desc) }
  
end