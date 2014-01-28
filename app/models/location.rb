class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :apartment_number
  validates_uniqueness_of :apartment_number, :scope => [:latitude, :longitude]
  has_many :comments, dependent: :destroy

  # validates :latitude, presence: :true
  # validates :latitude, uniqueness: { scope: :longitude, message: "every lattitude is allowed only one longitude" }
  # geocoded_by :address
  # before_validation :geocode

  def street_address
    address_components.first
  end

  def city_zip_and_country
    address_components[1..-1].join(",")
  end

  private

  def address_components
    address.split(",")
  end
end
