require 'rails_helper'
#User Story 12
RSpec.describe '/festivals/:id/edit' do
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
        expect(page).to have_field('name')
        expect(page).to have_field('city')
        expect(page).to have_content('Kid friendly')
        expect(page).to have_unchecked_field('True')
        expect(page).to have_unchecked_field('False')
        expect(page).to have_field('ticket_price')
        expect(page).to have_field('dates')
        expect(page).to have_content('Rv hookup')
        expect(page).to have_unchecked_field('True')
        expect(page).to have_unchecked_field('False')
        expect(page).to have_button('Edit Festival')

        click_button("Edit Festival")

        expect(current_path).to eq("/festivals/#{summer_camp.id}")
    end
    it "checks for the update" do
      visit "/festivals/#{summer_camp.id}/edit"
      # save_and_open_page
      fill_in("name", with: "Summer Camp")
      fill_in("city", with: "Chillicothe, IN")
      choose "kid_friendly_true"
      fill_in("festival_dates", with: "May 23th - 27th")
      fill_in("ticket_price", with: "750")
      choose "rv_hookup_true"

      # save_and_open_page
      click_on("Edit Festival")
      # save_and_open_page
      expect(current_path).to eq("/festivals/#{summer_camp.id}")
      expect(page).to have_content("Summer Camp")
      expect(page).to have_content("City/State: Chillicothe, IN")
      expect(page).to have_content("Are we kid friendly? true")
      expect(page).to have_content("Ticket Price: 750")
      expect(page).to have_content("Dates: May 23th - 27th")
      expect(page).to have_content("RV Hookup? true")
    end
  end
end