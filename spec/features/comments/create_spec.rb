require 'spec_helper'

describe "Adding comments" do
	let!(:idea) { Idea.create(title: "My idea", description: "this is my idea") }

	it "is successful with valid content" do
		visit "/ideas/2"
		fill_in "Commenter", with: "Jim"
		fill_in "Body", with: "This is a comment."
		click_button "Create Comment"
		expect(page).to have_content("Commenter: Jim")
		expect(page).to have_content("Comment: This is a comment.")
	end
	
end