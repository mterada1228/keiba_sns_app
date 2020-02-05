class User < ApplicationRecord
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
