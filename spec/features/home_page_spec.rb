require "rails_helper"
RSpec.feature "HomePages", type: :feature do
    scenario "The visitor should see name of shelter" do
      visit root_path
      expect(page).to have_text("Colorado Springs Dog Shelter")
    end
end