
# Normalizes address data that comes from the view to make it a usable
# for the geocoder

class Address
	attr_reader :params

	def initialize(params)
		@params = params
	end

	def self.normalize(params)
		self.new(params['location']).create_location_data
	end

	def apartment?
		params['apartment_number'].present?
	end

	def address_and_apartment
		if apartment?
			params['address'] + ", Apartment " + params['apartment_number']
		else
			params['address']
		end		
	end

	def city_and_state
		[params['city'], params['state']].join(" ")
	end

	def geocoder_compliant_address
		[address_and_apartment, city_and_state].join(", ")
	end

	def geocode
		GeocodingService.run(geocoder_compliant_address)
	end

	def create_location_data
		location_data = LocationData.new()
		coder_data = self.geocode
		location_data.address = coder_data['normalized_address']
		location_data.latitude = coder_data['lat_long']['lat']
		location_data.longitude = coder_data['lat_long']['lng']
		if apartment? 
			location_data.apartment_number = params['apartment_number'].to_s.upcase
		else
			location_data.apartment_number = ""
		end
		location_data
	end

	def check_uniqueness 

	end
end