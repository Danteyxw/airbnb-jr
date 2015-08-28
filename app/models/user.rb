class User < ActiveRecord::Base
  validates :email, presence: true
  validates :password, presence: true
  validates :email, uniqueness: true

  has_many :properties
  has_many :bookings
end
