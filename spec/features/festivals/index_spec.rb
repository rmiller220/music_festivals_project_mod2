require 'rails_helper'

RSpec.describe "/festivals", type: :feature do
  #User Story 1
  describe "as a visitor, when I visit the festival index page" do
   
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
    it "I see the name of each festival" do 

      visit "/festivals"
      
      expect(page).to have_content("Festivals Index Page")
      expect(page).to have_content(summer_camp.name)
      expect(page).to have_content(all_good.name)
    end
  end
  #User story 2
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
    end
  end
  #User Story 6
  describe "As a visitor, when I visit the Festival index" do
    
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
    let!(:arise) { Festival.create!(name: "Arise Music Festival",
                                    city: "Loveland, CO",
                                    kid_friendly: true,
                                    ticket_price: 400,
                                    dates: "August 2nd - 4th, 2023",
                                    rv_hookup: true,
                                    created_at: 2.days.ago)}
    it 'I see that records are ordered by most recently created first' do
      festivals = Festival.all
      visit "/festivals"
      # save_and_open_page
      assert festivals.sort_by_most_recent
      # require 'pry'; binding.pry
    end
    
    it 'Next to each of the records, I see when it was created' do
      visit "/festivals"
      
      save_and_open_page
      expect(page).to have_content("#{summer_camp.created_at}")
    end
  end
end