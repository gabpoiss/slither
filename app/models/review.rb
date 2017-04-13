class Review < ApplicationRecord
  belongs_to :user
  belongs_to :snake
  belongs_to :booking
  validates :content, presence: true, length: { minimum: 5, maximum: 140 }
  validates :stars, presence: true, inclusion: { in: [1, 2, 3, 4, 5]}
end
