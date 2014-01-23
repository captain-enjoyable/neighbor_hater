require 'spec_helper'

describe Address do 
	describe ".normalize" do
		it "returns acceptable params hash" do
			params = {"location" => {"address"=>"539 University Ave","apartment_number"=> "", "city"=>"Missoula", "state"=>"MT"}}
			normalized_location = {
				address: "539 University Avenue, Missoula, MT 59801, USA", 
				latitude: 46.859767, 
				longitude: -113.989401, 
				apartment_number: "!"
			}
			Address.normalize(params).as_params_hash.should == normalized_location
		end

		it "accounts for an apartment number" do
			params = {"location"=>{"address"=>"1005 11th Street","apartment_number"=> "2", "city"=>"Boulder", "state"=>"CO"}}
			normalized_location = {
				address: "1005 11th Street, Boulder, CO 80302, USA", 
				latitude: 40.005614, 
				longitude: -105.279032, 
				apartment_number: "2"	
			}
			Address.normalize(params).as_params_hash.should == normalized_location
		end
	end
end