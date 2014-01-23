class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :apartment_number
  validates_uniqueness_of :apartment_number, :scope => [:latitude, :longitude]
  # validates :latitude, presence: :true
  # validates :latitude, uniqueness: { scope: :longitude, message: "every lattitude is allowed only one longitude" }
  # geocoded_by :address
  # before_validation :geocode
end
