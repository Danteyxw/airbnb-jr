class Tag < ActiveRecord::Base
  has_many :property_tags
  has_many :properties, through: :property_tags
end
