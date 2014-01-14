
# Normalizes address data that comes from the view to make it a usable
# for the geocoder

class AddressNormalizer
	
	def self.run(param)
		self.new(param).normalize_address
	end

	def initialize(param)
		@params_hash = param
		puts param
	end

	def normalize_address
		if @params_hash['location']['apartment_number'] != ""
			normalized_address = @params_hash['location']['address'] + 
			", Apartment " + @params_hash['location']['apartment_number'] + 
			", " + @params_hash['location']['city'] + 
			" " + @params_hash['location']['state']
			return {:address => normalized_address}
		else
		 	normalized_address = @params_hash['location']['address'] + 
			", " + @params_hash['location']['city'] + 
			" " + @params_hash['location']['state']
			return {:address => normalized_address}
		end
	end

end