class Review < ApplicationRecord
  belongs_to :user
  belongs_to :snake
  belongs_to :booking
  validates :content, presence: true, length: { minimum: 140 }
  validates :starts, presence: true, inclusion: { in: [1, 2, 3, 4, 5]}
end
