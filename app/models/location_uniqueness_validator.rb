class LocationUniquenessValidator
	def initialize params
		@params = params
	end

	def unique? 
		if Location.where(@params).take
			false
		else
			true
		end
	end
end