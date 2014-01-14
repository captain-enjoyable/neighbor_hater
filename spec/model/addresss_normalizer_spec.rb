require 'spec_helper'

describe AddressNormalizer do 
	describe ".run" do
		
		params_hash = {"location" => {"address"=>"539 University Ave","apartment_number"=> "", "city"=>"Missoula", "state"=>"MT"}}

		it "returns normalized address" do
			AddressNormalizer.run(params_hash)[:address].should == "539 University Ave, Missoula MT"
		end

		params_hash2 = {"location"=>{"address"=>"1005 11th Street","apartment_number"=> "2", "city"=>"Boulder", "state"=>"CO"}}

		it "returns normalized address" do
			AddressNormalizer.run(params_hash2)[:address].should == "1005 11th Street, Apartment 2, Boulder CO"
		end
	end
end