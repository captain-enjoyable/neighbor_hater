require "spec_helper"

feature "Finding address and Commenting on them" do
	background do
		visit "/"
	end

	scenario "Searching for a house that exists", js: true do
		click_button "House"
		fill_in "location[address]", with: "539 University Avenue"
		fill_in "location[city]", with: "Missoula"
		select "Montana", from: "location[state]"
		click_button "Submit"
		page.should have_content "Ready to talk trash:"
	end

	scenario "Searching for an apartment that exists" do
		click_button "apartment"
		fill_in "Address", with: "1005 11th Street"
		fill_in "Apartment", with: "Apartment 2"
		fill_in "City", with: "Boulder"
		select "CO", from: "State"
		click_button "Submit"
		page.should have_content "Ready to talk trash:"
	end

	scenario "Searching for a buisness that exists" do
		click_button "apartment"
		fill_in "Address", with: "539 University Avenue"
		fill_in "City", with: "Missoula"
		select "MT", from: "State"
		click_button "Submit"
		page.should have_content "Ready to talk trash:"
	end

	scenario "Searching for an Address that doesn't exists" do
		click_button "Submit"
		page.should have_content "Error"
	end	
end
