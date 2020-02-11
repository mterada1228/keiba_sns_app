class Micropost < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :race, dependent: :destroy
  has_one :hosemark
  has_many :kaimes
  accepts_nested_attributes_for :hosemark
  accepts_nested_attributes_for :kaimes
end