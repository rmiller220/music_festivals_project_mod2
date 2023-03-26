require 'rails_helper'

RSpec.describe "/festivals/:festival_id/artists", type: :feature do
  #User Story 5
  describe "As a visitor, when I visit '/festivals/:festival_id/artists'" do
    before(:each) do 
      @summer_camp = Festival.create!(name: "Summer Camp Music Festival",
                                      city: "Chillicothe, IL",
                                      kid_friendly: true,
                                      ticket_price: 600,
                                      dates: "May 26th - 28th, 2023",
                                      rv_hookup: false)
      @all_good = Festival.create!(name: "All Good Music Festival",
                                  city: "Masontown, WV",
                                  kid_friendly: true,
                                  ticket_price: 550,
                                  dates: "July 15th - 17th, 2023",
                                  rv_hookup: false)
      @sts9 = @summer_camp.artists.create!(name: "STS9",
                                          explicit_content: false,
                                          performance_day: "Friday, Saturday",
                                          number_of_performances: 2,
                                          festival_appearances: 10,
                                          festival: @summer_camp)
      @bone_thugs = Artist.create!(name: "Bone Thugs in Harmony",
                                  explicit_content: true,
                                  performance_day: "Sunday",
                                  number_of_performances: 1,
                                  festival_appearances: 3,
                                  festival: @summer_camp)
    end
    it "I see each Artist that is associated with that Festival with each Artist's attributes" do
      visit "/festivals/#{@summer_camp.id}/artists"
      save_and_open_page
      expect(page).to have_content("#{@summer_camp.name} Lineup")
      expect(page).to have_content("#{@sts9.name}")
      expect(page).to have_content("Explicit Content: #{@sts9.explicit_content}")
      expect(page).to have_content("Performance Day: #{@sts9.performance_day}")
      expect(page).to have_content("Number of Performances: #{@sts9.number_of_performances}")
      expect(page).to have_content("Festival Appearances: #{@sts9.festival_appearances}")
      
      expect(page).to have_content("#{@bone_thugs.name}")
      expect(page).to have_content("Explicit Content: #{@bone_thugs.explicit_content}")
      expect(page).to have_content("Performance Day: #{@bone_thugs.performance_day}")
      expect(page).to have_content("Number of Performances: #{@bone_thugs.number_of_performances}")
      expect(page).to have_content("Festival Appearances: #{@bone_thugs.festival_appearances}")
    end
  end
end