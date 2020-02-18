class User < ApplicationRecord
  
  # 依存関係
  has_many :microposts, dependent: :destroy
  
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  
  has_many :favorites
  has_many :favorite_microposts, through: :favorites, source: :micropost
  
  # バリデーション
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, 
                    length: { maximum: 255 }, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, presence: true, allow_nil: true
  has_secure_password
  validate  :picture_size
  
  # コールバックメソッド
  before_save :downcase_email # email cast to downcase
  
  # 画像投稿メソッド
  mount_uploader :picture, PictureUploader
  
  # ユーザーをフォローする
  def follow(other_user)
    following << other_user
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end
  
  # 投稿をお気に入りにする
  def favorite(micropost)
    favorite_microposts << micropost
  end

  # 投稿のお気に入りを解除する
  def unfavorite(micropost)
    favorites.find_by(micropost: micropost.id).destroy
  end

  # 現在のユーザーが投稿をお気に入りにしてたらtrueを返す
  def favorite?(micropost)
    favorite_microposts.include?(micropost)
  end
  
  # ユーザの検索
  def self.search(name)
    if name
      where(['name LIKE ?', "%#{name}%"])
    else
      all
    end
  end
  
  private

    # emailを小文字にする
    def downcase_email
      self.email.downcase!
    end
    
    # アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "画像のサイズは5MB以下にしてください")
      end
    end
    
  # Userのクラスメソッド
  class << self
    # 渡された文字列のハッシュ値を返す
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
  end

end
