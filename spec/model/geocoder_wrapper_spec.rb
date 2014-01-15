require 'spec_helper'

describe GeocoderWrapper do

	describe ".address_to_lat_long" do 
		GeocoderWrapper.address_to_lat_long.should("539 University Ave, Missoula MT") == {"lat"=>46.859767, "lng"=>-113.989401}
	end

	describe "normalize_address" do
		GeocoderWrapper.normalize_address_name({"lat"=>46.859767, "lng"=>-113.989401}).should == "539 University Avenue, Missoula, MT 59801, USA"
	end
	
end


