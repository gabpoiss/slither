
  class Snake < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  validates :name, presence: true
  validates :sex, presence: true, inclusion: { in: ["Male", "Female", "Unknown"]}
  validates :available, presence: true
  validates :breed, presence: true
  has_attachment :photo
  after_validation :geocode, if: :address_changed?


  # We need a validator to make sure the price is greater than zero
  # validates :price, presence: true, greater_than_or_equal_to: 0

end
