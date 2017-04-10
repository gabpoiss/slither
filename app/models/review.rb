class Review < ApplicationRecord
  belongs_to :user
  belongs_to :snake
  belongs_to :booking
end
