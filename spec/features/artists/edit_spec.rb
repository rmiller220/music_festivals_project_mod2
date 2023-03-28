require "rails_helper"

RSpec.describe '/artists/:id/edit' do
  #User Story 14
  describe "artist#edit" do
    before(:each) do 
      @summer_camp = Festival.create!(name: "Summer Camp Music Festival",
                                      city: "Chillicothe, IL",
                                      kid_friendly: true,
                                      ticket_price: 600,
                                      dates: "May 26th - 28th, 2023",
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

    it 'I see a form to edit the Artist' do

      visit "/artists/#{@sts9.id}/edit"
      save_and_open_page
      expect(page).to have_field('name')
      expect(page).to have_content('Explicit content')
      expect(page).to have_unchecked_field('True')
      expect(page).to have_unchecked_field('False')
      expect(page).to have_field('performance_day')
      expect(page).to have_field('number_of_performances')
      expect(page).to have_field('festival_appearances')
      expect(page).to have_button("Edit Artist")
    end

    it "When I click 'Edit Artist' button, I am taken to the '/artists/:id' page
        where I see the updated Artist attributes" do
      visit "/artists/#{@sts9.id}/edit"

      fill_in("name", with: "Sound Tribe")
      choose "explicit_content_true"
      fill_in("performance_day", with: "Saturday")
      fill_in("number_of_performances", with: "1")
      fill_in("festival_appearances", with: "4")
      click_button "Edit Artist"

      expect(current_path).to eq("/artists/#{@sts9.id}")

      expect(page).to have_content("Sound Tribe")
      expect(page).to have_content("Explicit Content: true")
      expect(page).to have_content("Performance Day: Saturday")
      expect(page).to have_content("Number of Performances: 1")
      expect(page).to have_content("Festival Appearances: 4")
    end
  end
end
# User Story 14, Child Update 

# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information