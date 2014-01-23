require 'spec_helper'

# address
# collects address params
# validates the data it recieves
# returns a canocial version of itself


describe Address do

	it "knows its type" do
		expect(described_class.new(type: "apartment").type).to eq "apartment"
	end

	it "knows its city" do
		expect(described_class.new(city: "Missoula").city).to eq "Missoula"
	end

	it "knows its state" do
		expect(described_class.new(state: "Montana").state).to eq "Montana"
	end

	it "knows its address" do
		expect(described_class.new(address: "539 University Ave").address).to eq "539 University Ave"
	end

	it "knows its apartment number" do
		expect(described_class.new(apartment_number: "1").apartment_number).to eq "1"
	end

	describe "validations" do
		it "adds errors if the type is nonsense" do
			address = described_class.new(type: "snakes")
			address.valid?
			address.errors[:type].should include("is invalid")
		end

		it "adds errors if it is missing a city" do
			address = described_class.new(city: "")
			address.valid?
			address.errors[:city].should include("can't be blank")
		end

		it "adds errors if it is missing a state" do
			address = described_class.new(state: "")
			address.valid?
			address.errors[:state].should include("can't be blank")
		end

		it "adds errors if it is missing an address" do
			address = described_class.new(address: "")
			address.valid?
			address.errors[:address].should include("can't be blank")
		end

		it "is valid with a city, state and address" do
			address = described_class.new(type: "house", address: "address", city: "city", state: "State")
			address.should be_valid
		end

		context "a apartment" do
			it "adds errors if it is missing an apartment_number" do
				address = described_class.new({
					type: "apartment",
					address: "address",
					city: "city",
					state: "State"
				})
				address.valid?
				expect(address.errors[:apartment_number]).to include("can't be blank")
			end

			it "is valid with a city, state, address and apartment_number" do
				address = described_class.new({
					type: "apartment",
					address: "address",
					city: "city",
					state: "State",
					apartment_number: "123"
				})
				expect(address).to be_valid

			end
		end
	end


	describe ".normalize" do
		before { pending }
		it "returns acceptable params hash" do
			params = {"location" => {"address"=>"539 University Ave","apartment_number"=> "", "city"=>"Missoula", "state"=>"MT"}}
			normalized_location = {
				address: "539 University Avenue, Missoula, MT 59801, USA",
				latitude: 46.859767,
				longitude: -113.989401,
				apartment_number: ""
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
