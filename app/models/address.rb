
# Normalizes address data that comes from the view to make it a usable
# for the geocoder

class Address
	attr_reader :params

	def initialize(params)
		@params = params
	end

	def self.normalize(params)
		self.new(params['location']).geocoder_compliant_address
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
end