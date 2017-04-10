class Snake < ApplicationRecord
  belongs_to :user
  has_many :reviews, :bookings, dependent: :destroy
  validates :name, presence: true, length: { in 6..20 }, exclusion: { in: (0..9).map! { |i| i.to_s } }
  validates :sex, presence: true, inclusion: { in ["male", "female", "unknown"]}
  validates :available, presence: true
  validates :breed, presence: true, exclusion: { in: (0..9).map! { |i| i.to_s } }
  validates :price, presence: true, greater_than_or_equal_to: 0
end
