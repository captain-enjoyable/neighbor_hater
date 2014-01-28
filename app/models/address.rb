
# address
# collects address params
# validates the data it recieves
# returns a canocial version of itself


# Normalizes address data that comes from the view to make it a usable
# for the geocoder

class Address
	extend ActiveModel::Naming
	include ActiveModel::Validations
	include ActiveModel::Conversion

	TYPES = ["apartment", "business", "house"]

	attr_accessor :params, :type, :city, :state, :address, :apartment_number

	validates :city, :state, :address, presence: true
	validates :apartment_number, presence: true, if: :apartment?
	validates :type, inclusion: {in: TYPES, message: "is invalid"}

	def initialize(params = {})
		@params = params
		@type = params[:type]
		@city = params[:city]
		@state = params[:state]
		@address = params[:address]
		@apartment_number = params[:apartment_number]
	end

	def apartment?
		type == "apartment"
	end

	def persisted?
		false
	end

	def address_and_apartment
		if apartment?
			address + ", Apartment " + apartment_number
		else
			address
		end
	end

	def city_and_state
		[city, state].join(" ")
	end

	def to_canonical
		params = create_location_data.as_params_hash

	    if LocationUniquenessValidator.new(params).unique?
	      Location.create(params)
	    else
	      Location.where(params).take
	    end
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
			location_data.apartment_number = apartment_number.to_s.upcase
		else
			location_data.apartment_number = ""
		end
		location_data
	end
end
