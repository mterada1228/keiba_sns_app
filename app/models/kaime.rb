class Kaime < ApplicationRecord
  belongs_to :micropost, dependent: :destroy
end
