class Property < ActiveRecord::Base
  belongs_to :user
  has_many :property_tags
  has_many :tags, through: :property_tags
  has_many :bookings
end
