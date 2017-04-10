class Snake < ApplicationRecord
  belongs_to :user
  has_many :reviews, :bookings, dependent: :destroy
end
