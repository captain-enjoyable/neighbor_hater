require 'spec_helper'

describe GeocodingService do

	describe ".address_to_lat_long" do 
		it "SHould return the lat long of an address" do
			GeocodingService.run('539 University Ave, Missoula MT')['lat_long'].should == {"lat"=>46.859767, "lng"=>-113.989401}
		end
	end

	describe ".normalize_location_name" do
		it "It should return a formalized address name from a lat long" do	
			GeocodingService.run('539 University Ave, Missoula MT')['normalized_address'].should == "539 University Avenue, Missoula, MT 59801, USA"
		end
	end
end


