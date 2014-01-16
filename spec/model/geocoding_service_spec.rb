require 'spec_helper'

describe GeocodingService do

	describe ".address_to_lat_long" do 
		it "SHould return the lat long of an address" do
		GeocodingService.address_to_lat_long.should("539 University Ave, Missoula MT") == {"lat"=>46.859767, "lng"=>-113.989401}
		end
	end

	describe ".normalize_location_name" do
		it "It should return a formalized address name from a lat long" do	
			GeocodingService.normalize_location_name({"lat"=>46.859767, "lng"=>-113.989401}).should == "539 University Avenue, Missoula, MT 59801, USA"
		end
	end

end


