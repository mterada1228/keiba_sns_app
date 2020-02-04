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
  
  # コールバックメソッド
  before_save :downcase_email # email cast to downcase
  
  private

    # emailを小文字にする
    def downcase_email
      self.email.downcase!
    end

end
