class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :snake
  has_many :reviews, dependent: :destroy
  validates :from, :until, presence: true
  # We are going to want to validate "from" and "until". I plan on doing that
  # once I'm able to test this code, because it will require creating custom
  # validation functions to, for instance, makes sure that "until" comes after
  # "from" and that they both are after the present.
end
