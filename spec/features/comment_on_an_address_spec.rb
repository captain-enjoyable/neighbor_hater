require "spec_helper"
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
feature "Commenting on an addresss" do
	background do
		address = Location.create(:city => “Missoula”, :address => “whatever”)
		visit “/address/” + address.id.to_s 
	end

	scenario "Commenting on a house", js: true do
		
	end
end