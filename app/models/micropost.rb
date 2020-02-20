class Micropost < ApplicationRecord
  
  # 各テーブルとの依存関係を定義する
  belongs_to :user, dependent: :destroy
  belongs_to :race, dependent: :destroy
  has_one :hosemark
  has_many :kaimes
  accepts_nested_attributes_for :hosemark
  accepts_nested_attributes_for :kaimes
  
  has_many :reply_relationships, class_name: "ReplyRelationship",
                                 foreign_key: "replied_post_id"
  has_many :reply_posts, through: :reply_relationships, source: :reply_post
  
  # created_at の 降順（DESC）で並び替える
  default_scope -> { order(created_at: :desc) }
  
  # リプライを受ける
  def replied(micropost)
    reply_posts << micropost
  end
  
end