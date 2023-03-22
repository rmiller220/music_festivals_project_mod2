require 'rails_helper'

RSpec.describe "/festivals", type: :feature do
  #User Story 1
  describe "as a visitor, when I visit the festival index page" do
    it "I see the name of each festival" do

      visit "/festivals"

      expect(page).to have_content(summer_camp.name)
      expect(page).to have_content(all_good.name)
    end
  end
end