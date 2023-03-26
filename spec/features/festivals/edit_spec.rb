require 'rails_helper'

RSpec.describe '/festivals/new' do
  # before(:each) do
  #   visit '/festivals/:id/edit'
  # end
  #User story 11
  describe "festivals#edit" do
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
    it "When I click this link, I am taken to '/festivals/:id/edit' where I can
      edit a festival" do
        visit "/festivals/#{summer_camp.id}/edit"
        expect(page).to have_field('festival[name]')
        expect(page).to have_field('festival[city]')
        expect(page).to have_content('Kid Friendly')
        expect(page).to have_unchecked_field('True')
        expect(page).to have_unchecked_field('False')
        expect(page).to have_field('Ticket Price')
        expect(page).to have_field('Dates')
        expect(page).to have_content('RV Hookup')
        expect(page).to have_unchecked_field('True')
        expect(page).to have_unchecked_field('False')
        expect(page).to have_button('Edit Festival')

        click_button("Edit Festival")

        expect(current_path).to eq("/festivals/#{summer_camp.id}")
    end
    # it "checks for the update" do
    #   visit "/festivals/#{summer_camp.id}/edit"
    #   save_and_open_page
    #   # fill_in("Festival Name:", with: "Summer Camp Music Festival")
    #   # fill_in("City/State:", with: "Chillicothe, IL")
    #   choose("True")
    #   fill_in("Ticket Price", with: "650")
    #   fill_in("Dates", with: "May 24th - 26th")
    #   choose("True")

    #   click_on("Edit Festival")

    #   expect(page).to have_content("Summer Camp Music Festival")
    #   expect(page).to have_content("City/State: Chillicothe, IL")
    #   expect(page).to have_content("Are we kid friendly? True")
    #   expect(page).to have_content("Ticket Price: 650")
    #   expect(page).to have_content("Dates: May 24th - 26th")
    #   expect(page).to have_content("RV Hookup? True")
    # end
  end
end