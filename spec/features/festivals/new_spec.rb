require 'rails_helper'

RSpec.describe '/festivals/new' do
  before(:each) do
    visit '/festivals/new'
  end
  #User story 11
  describe "festivals#new"
    it "When I click this link, I am taken to '/festivals/new' where I see a form
          for a new festival record" do

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
        expect(page).to have_button('Add New Festival')
    end

    it "When I fill out the form with a new festival's attributes:
          and I click the button 'Create Festival' to submit the form
          then a 'Post' request is sent to the '/parents' route, 
          a new parent record is created, and I am redirected to the
          Festival Index page where I see the new Festival displayed" do
       
        fill_in("name", with: "Summer Camp Music Festival")
        fill_in("city", with: "Chillicothe, IL")
        choose "kid_friendly_true"
        fill_in("ticket_price", with: "650")
        fill_in("dates", with: "May 24th - 26th")
        choose "rv_hookup_true"
  
        click_button("Add New Festival")

        expect(current_path).to eq("/festivals")
        expect(page).to have_content("Summer Camp Music Festival")
      
    end
end