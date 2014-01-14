require 'spec_helper'

describe AddressNormalizer do 
	describe ".run" do
		it "combines address fields into a single string" do
			params = {"location" => {"address"=>"539 University Ave","apartment_number"=> "", "city"=>"Missoula", "state"=>"MT"}}
			AddressNormalizer.run(params)[:address].should == "539 University Ave, Missoula MT"
		end

		it "accounts for an apartment number" do
			params = {"location"=>{"address"=>"1005 11th Street","apartment_number"=> "2", "city"=>"Boulder", "state"=>"CO"}}
			AddressNormalizer.run(params)[:address].should == "1005 11th Street, Apartment 2, Boulder CO"
		end
	end
end