class User < ActiveRecord::Base
  validates :email, uniqueness: true

  has_many :properties
  has_many :bookings
end
