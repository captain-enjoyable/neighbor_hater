require "spec_helper"
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

feature "Finding address and Commenting on them" do
	background do
		visit "/"
	end

	scenario "Searching for a house that exists", js: true do
		click_button "House"
		fill_in "Address", with: "539 University Avenue"
		fill_in "City", with: "Missoula"
		select "Montana", from: "State"
		click_button "Submit"
		page.should have_content "Ready to talk trash:"
	end

	scenario "Searching for an apartment that exists", js: true do
		click_button "Apartment"
		fill_in "Address", with: "1005 11th Street"
		fill_in "Apartment number", with: "Apartment 2"
		fill_in "City", with: "Boulder"
		select "Colorado", from: "State"
		click_button "Submit"
		page.should have_content "Ready to talk trash:"
	end

	scenario "Searching for a business that exists", js: true do
		click_button "Business"
		fill_in "Address", with: "539 University Avenue"
		fill_in "City", with: "Missoula"
		select "Montana", from: "State"
		click_button "Submit"
		page.should have_content "Ready to talk trash:"
	end

	scenario "Searching for an Address that doesn't exists", js: true do
		click_button "House"
		click_button "Submit"
		page.should have_content "Error"
	end
end
