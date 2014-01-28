require "spec_helper"
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
feature "Commenting on an addresss" do
	background do
		address = Location.create!({
			 :address => "539 University Avenue, Missoula, MT 59801, USA",
			 :latitude => 10, 
			 :longitude => 10, 
			 :apartment_number => " "
		})
		visit "/addresses/#{address.id}"
	end

	scenario "Commenting on a house" do
			fill_in "Headline", with: "I hate my neighbors"
			fill_in "Body", with: "My neighbors have loud sex and it hurts my ears"
			click_button "Submit"
			page.should have_content "I hate my neighbors"
			page.should	have_content "My neighbors have loud"
	end
end