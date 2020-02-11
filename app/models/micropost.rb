class Micropost < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :race, dependent: :destroy
  has_one :hosemark
  accepts_nested_attributes_for :hosemark
end