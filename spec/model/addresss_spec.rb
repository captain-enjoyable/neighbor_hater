require 'spec_helper'

describe Address do 
	describe ".normalize" do
		it "combines address fields into a single string" do
			params = {"location" => {"address"=>"539 University Ave","apartment_number"=> "", "city"=>"Missoula", "state"=>"MT"}}
			Address.normalize(params).should == "539 University Ave, Missoula MT"
		end

		it "accounts for an apartment number" do
			params = {"location"=>{"address"=>"1005 11th Street","apartment_number"=> "2", "city"=>"Boulder", "state"=>"CO"}}
			Address.normalize(params).should == "1005 11th Street, Apartment 2, Boulder CO"
		end
	end
end