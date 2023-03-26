require 'rails_helper'

RSpec.describe '/festivals/new' do
  before(:each) do
    visit '/festivals/new'
  end
  describe "festivals#new"
    it "When I click this link, I am taken to '/festivals/new' where I see a form
          for a new festival record" do
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
        expect(page).to have_button('Add New Festival')
    end

    it "When I fill out the form with a new festival's attributes:
          and I click the button 'Create Festival' to submit the form
          then a 'Post' request is sent to the '/parents' route, 
          a new parent record is created, and I am redirected to the
          Festival Index page where I see the new Festival displayed" do
        
        click_button("Add New Festival")

        expect(current_path).to eq("/festivals")
    end
end