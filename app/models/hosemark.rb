class Hosemark < ApplicationRecord
  belongs_to :micropost, dependent: :destroy
end
