class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bookings, :reviews, :snakes, dependent: :destroy
  validates :username, presence: true, length: { in: 6..20 }
  validates :first_name, :last_name, presence: true, exclusion: { in: (0..9).map! { |i| i.to_s } }
  validates :lat, :lng, presence: true
end
