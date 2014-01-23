class LocationData
	attr_accessor :id, :address, :latitude, :longitude, :apartment_number
	def as_params_hash
		{
			address: self.address,
			latitude: self.latitude,
			longitude: self.longitude,
			apartment_number: self.apartment_number
		}
	end
end