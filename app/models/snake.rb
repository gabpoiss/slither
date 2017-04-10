class Snake < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :name, presence: true, length: { in: 6..20 }
  validates :sex, presence: true, inclusion: { in: ["male", "female", "unknown"]}
  validates :available, presence: true
  validates :breed, presence: true
  # We need a validator to make sure the price is greater than zero
  # validates :price, presence: true, greater_than_or_equal_to: 0
end
