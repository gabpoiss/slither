class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :snake
  has_many :reviews, dependent: :destroy
end
