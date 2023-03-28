require 'rails_helper'

RSpec.describe "/festivals", type: :feature do
  describe "as a visitor, when I visit the festivals/:id" do
    
    let!(:summer_camp) { Festival.create!(name: "Summer Camp Music Festival",
                                          city: "Chillicothe, IL",
                                          kid_friendly: true,
                                          ticket_price: 600,
                                          dates: "May 26th - 28th, 2023",
                                          rv_hookup: false)}
    let!(:all_good) { Festival.create!(name: "All Good Music Festival",
                                       city: "Masontown, WV",
                                       kid_friendly: true,
                                       ticket_price: 550,
                                       dates: "July 15th - 17th, 2023",
                                       rv_hookup: false)}
    
    it 'I see the Festival with that id, including its attributes' do

      visit "/festivals/#{summer_camp.id}"
      # save_and_open_page

      expect(page).to have_content("#{summer_camp.name}")
      expect(page).to have_content("City/State: #{summer_camp.city}")
      expect(page).to have_content("Are we kid friendly? #{summer_camp.kid_friendly}")
      expect(page).to have_content("Ticket Price: #{summer_camp.ticket_price}")
      expect(page).to have_content("Dates: #{summer_camp.dates}")
      expect(page).to have_content("RV Hookup? #{summer_camp.rv_hookup}")

      visit "/festivals/#{all_good.id}"
      # save_and_open_page

      expect(page).to have_content("#{all_good.name}")
      expect(page).to have_content("City/State: #{all_good.city}")
      expect(page).to have_content("Are we kid friendly? #{all_good.kid_friendly}")
      expect(page).to have_content("Ticket Price: #{all_good.ticket_price}")
      expect(page).to have_content("Dates: #{all_good.dates}")
      expect(page).to have_content("RV Hookup? #{all_good.rv_hookup}")
    end
  end

  #User story 7
  describe "As a visitor, when I visit a parents show page" do
    let!(:summer_camp) { Festival.create!(name: "Summer Camp Music Festival",
                                          city: "Chillicothe, IL",
                                          kid_friendly: true,
                                          ticket_price: 600,
                                          dates: "May 26th - 28th, 2023",
                                          rv_hookup: false,
                                          created_at: 1.day.ago)}
    let!(:all_good) { Festival.create!(name: "All Good Music Festival",
                                      city: "Masontown, WV",
                                      kid_friendly: true,
                                      ticket_price: 550,
                                      dates: "July 15th - 17th, 2023",
                                      rv_hookup: false,
                                      created_at: 3.days.ago)}     
    let!(:sts9) { Artist.create!(name: "STS9",
                                explicit_content: false,
                                performance_day: "Friday, Saturday",
                                number_of_performances: 2,
                                festival_appearances: 10,
                                festival: summer_camp)}
    let!(:sts9_a) { Artist.create!(name: "STS9",
                                explicit_content: false,
                                performance_day: "Saturday",
                                number_of_performances: 1,
                                festival_appearances: 5,
                                festival: all_good)}
    let!(:bone_thugs) { Artist.create!(name: "Bone Thugs in Harmony",
                                      explicit_content: true,
                                      performance_day: "Sunday",
                                      number_of_performances: 1,
                                      festival_appearances: 3,
                                      festival: summer_camp)}
    let!(:bassnectar) { Artist.create!(name: "Bassnectar",
                                      explicit_content: false,
                                      performance_day: "Friday",
                                      number_of_performances: 1,
                                      festival_appearances: 2,
                                      festival: all_good)}
    it "I see a count of the number of artists associated with the festival" do
      visit "/festivals/#{summer_camp.id}"
      # save_and_open_page

        expect(page).to have_content("Total Artists Performing at #{summer_camp.name}: #{summer_camp.artist_count}")
    end
  end
end