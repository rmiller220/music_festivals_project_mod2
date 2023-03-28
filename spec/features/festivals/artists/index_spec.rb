require 'rails_helper'

RSpec.describe "/festivals/:festival_id/artists", type: :feature do
  #User Story 5
  describe "As a visitor, when I visit '/festivals/:id/artists'" do
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
      # save_and_open_page
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
    it "I see a link to take me to that festival's artists page '/festivals/:id/artists'" do
      artists = "Artists Index"
      
      visit "/festivals/#{summer_camp.id}"
      click_on artists
      # save_and_open_page
      
      expect(current_path).to eq("/festivals/#{summer_camp.id}/artists")
      
      visit "/festivals/#{all_good.id}"
      click_on artists
      
      expect(current_path).to eq("/festivals/#{all_good.id}/artists")
    end
  end

  describe "/festivals/:id/artists" do
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
    it "I see a link to add a new Artist for specific festival" do
      visit "/festivals/#{summer_camp.id}/artists"
      # save_and_open_page
      expect(page).to have_link('Add Artist')
    end
    
    it "When I click the link, I am taken to 'festivals/:id/artists/new' page
    where I see a form to add a new Artist" do
      visit "/festivals/#{summer_camp.id}/artists"
      click_link("Add Artist")
      # save_and_open_page
      expect(current_path).to eq("/festivals/#{summer_camp.id}/artists/new")
    end

    it "When I fill in the form of the Artist's attributes, and click 'Add artist' I am 
        redirected to '/festivals/:id/artists' where it adds the artist to the page" do
        
        visit "festivals/#{summer_camp.id}/artists/new"

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
        # save_and_open_page
        click_button "Add Artist"

        expect(current_path).to eq("/festivals/#{summer_camp.id}/artists")


        expect(page).to have_content("The Main Squeeze")
        expect(page).to have_content("Explicit Content: true")
        expect(page).to have_content("Performance Day: Saturday")
        expect(page).to have_content("Number of Performances: 1")
        expect(page).to have_content("Festival Appearances: 7")
    end
  end
end
