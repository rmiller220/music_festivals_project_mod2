require 'rails_helper'

RSpec.describe "/festivals/:festival_id/artists", type: :feature do
  describe "Festival's Artists Index" do
    before(:each) do
      Artist.delete_all
      Festival.delete_all
      @summer_camp = Festival.create!(name: "Summer Camp Music Festival",
                                      city: "Chillicothe, IL",
                                      kid_friendly: true,
                                      ticket_price: 600,
                                      dates: "May 26th - 28th, 2023",
                                      rv_hookup: false,
                                      created_at: 1.day.ago)
      @all_good = Festival.create!(name: "All Good Music Festival",
                                  city: "Masontown, WV",
                                  kid_friendly: true,
                                  ticket_price: 550,
                                  dates: "July 15th - 17th, 2023",
                                  rv_hookup: false,
                                  created_at: 3.days.ago)     
      @arise = Festival.create!(name: "Arise Music Festival",
                                city: "Loveland, CO",
                                kid_friendly: true,
                                ticket_price: 400,
                                dates: "August 2nd - 4th, 2023",
                                rv_hookup: true,
                                created_at: 2.days.ago)
  
      @sts9 = @summer_camp.artists.create!(name: "STS9",
                                          explicit_content: false,
                                          performance_day: "Friday, Saturday",
                                          number_of_performances: 2,
                                          festival_appearances: 10)
      @sts9_a = @all_good.artists.create!(name: "STS9",
                                          explicit_content: false,
                                          performance_day: "Saturday",
                                          number_of_performances: 1,
                                          festival_appearances: 5)
      @bone_thugs = @summer_camp.artists.create!(name: "Bone Thugs in Harmony",
                                                explicit_content: true,
                                                performance_day: "Sunday",
                                                number_of_performances: 1,
                                                festival_appearances: 3)
      @bassnectar = @all_good.artists.create!(name: "Bassnectar",
                                              explicit_content: false,
                                              performance_day: "Friday",
                                              number_of_performances: 1,
                                              festival_appearances: 2)
      @pretty_lights = @summer_camp.artists.create!(name: "Pretty Lights",
                                                    explicit_content: false,
                                                    performance_day: "Friday, Saturday",
                                                    number_of_performances: 1,
                                                    festival_appearances: 3)
      @yonder = @all_good.artists.create!(name: "Yonder Mountain String Band",
                                          explicit_content: false,
                                          performance_day: "Sunday",
                                          number_of_performances: 1,
                                          festival_appearances: 4)
      end
  
    #User Story 5
    describe "As a visitor, when I visit '/festivals/:id/artists'" do
      it "I see each Artist that is associated with that Festival with each Artist's attributes" do
        visit "/festivals/#{@summer_camp.id}/artists"
        
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
    #User Story 10
    describe "As a visitor, when I visit '/festivals/:id'" do
      it "I see a link to take me to that festival's artists page '/festivals/:id/artists'" do
        artists = "Artists Index"
        
        visit "/festivals/#{@summer_camp.id}"
        click_on artists
        
        
        expect(current_path).to eq("/festivals/#{@summer_camp.id}/artists")
        
        visit "/festivals/#{@all_good.id}"
        click_on artists
        
        expect(current_path).to eq("/festivals/#{@all_good.id}/artists")
      end
    end

    describe "/festivals/:id/artists" do
      it "I see a link to add a new Artist for specific festival" do
        visit "/festivals/#{@summer_camp.id}/artists"
        
        expect(page).to have_link('Add Artist')
      end
      
      it "When I click the link, I am taken to 'festivals/:id/artists/new' page
      where I see a form to add a new Artist" do
        visit "/festivals/#{@summer_camp.id}/artists"

        click_link("Add Artist")

        expect(current_path).to eq("/festivals/#{@summer_camp.id}/artists/new")
      end

      it "When I fill in the form of the Artist's attributes, and click 'Add artist' I am 
          redirected to '/festivals/:id/artists' where it adds the artist to the page" do
          
          visit "festivals/#{@summer_camp.id}/artists/new"

          expect(page).to have_content('Name')
          expect(page).to have_field('name')
          expect(page).to have_field('performance_day')
          expect(page).to have_content('Explicit content')
          expect(page).to have_unchecked_field('True')
          expect(page).to have_unchecked_field('False')
          expect(page).to have_content('Number of performances')
          expect(page).to have_field('number_of_performances')
          expect(page).to have_content('Festival appearances')
          expect(page).to have_field('festival_appearances')
          expect(page).to have_button('Add Artist')

          fill_in("name", with: "The Main Squeeze")
          fill_in("performance_day", with: "Saturday")
          choose "explicit_content_true"
          fill_in("number_of_performances", with: "1")
          fill_in("festival_appearances", with: "7")
          
          click_button "Add Artist"

          expect(current_path).to eq("/festivals/#{@summer_camp.id}/artists")


          expect(page).to have_content("The Main Squeeze")
          expect(page).to have_content("Explicit Content: true")
          expect(page).to have_content("Performance Day: Saturday")
          expect(page).to have_content("Number of Performances: 1")
          expect(page).to have_content("Festival Appearances: 7")
      end
    end

    #User Story 16
    describe "#sort_alphabetically" do
      it "When I visit the '/festivals/:id/artists' page, I see a link
          to sort the artists in alphabetical order" do
          
          visit "/festivals/#{@summer_camp.id}/artists"
          
          expect(page).to have_link("Sort Alphabetically")
      end
        
      it "When I click the link, I am taken back to '/festivals/:id/artists'
      where I now see all of the artists, sorted alphabetically" do
        
        visit "/festivals/#{@summer_camp.id}/artists"
        
        expect(@sts9.name).to appear_before(@bone_thugs.name)

        click_link "Sort Alphabetically"

        expect(current_path).to eq("/festivals/#{@summer_camp.id}/artists")

        expect(@bone_thugs.name).to appear_before(@sts9.name)
      end
    end
    # User Story 21
    describe "Filter Festival's Artists" do
      it "When I visit '/festivals/:id/artists' I see a form, with a link"

      it "When I click the link, it returns only the Artists that fits
          the input requirements"
    end
  end
end

# User Story 21, Display Records Over a Given Threshold 

# As a visitor
# When I visit the Parent's children Index Page
# I see a form that allows me to input a number value
# When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
# Then I am brought back to the current index page with only the records that meet that threshold shown.
