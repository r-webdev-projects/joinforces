require "spec_helper"

describe "Signing up" do 
	it "allows a user to sign up for the site and creates the object in the database" do 

		visit "/"
		expect(page).to have_content("Register")
		click_link "Register"
	end
end