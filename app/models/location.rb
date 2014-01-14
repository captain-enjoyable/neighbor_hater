class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude
  # validates :latitude, presence: :true
  # validates :latitude, uniqueness: { scope: :longitude, message: "every lattitude is allowed only one longitude" }
  geocoded_by :address
  before_validation :geocode
end
