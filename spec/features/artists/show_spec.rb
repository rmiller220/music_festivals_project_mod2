require 'rails_helper'

RSpec.describe type: :feature do
  describe "Artist show page, '/artists/:id' " do
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
    end
  #User story 4
    describe "As a visitor, when I visit '/artists/:id'" do
      it 'I see the Artist with that id, including its attribute' do
        visit "/artists/#{@sts9.id}"
        

        expect(page).to have_content("#{@sts9.name}")
        expect(page).to have_content("Explicit Content: #{@sts9.explicit_content}")
        expect(page).to have_content("Performance Day: #{@sts9.performance_day}")
        expect(page).to have_content("Number of Performances: #{@sts9.number_of_performances}")
        expect(page).to have_content("Festival Appearances: #{@sts9.festival_appearances}")
      
        visit "/artists/#{@bone_thugs.id}"
        

        expect(page).to have_content("#{@bone_thugs.name}")
        expect(page).to have_content("Explicit Content: #{@bone_thugs.explicit_content}")
        expect(page).to have_content("Performance Day: #{@bone_thugs.performance_day}")
        expect(page).to have_content("Number of Performances: #{@bone_thugs.number_of_performances}")
        expect(page).to have_content("Festival Appearances: #{@bone_thugs.festival_appearances}")
      end
    end
    #User Story 18
    describe "When I visit '/artists/:id' page" do
      it "I see a link to update the artist" do
        visit "/artists/#{@bone_thugs.id}"
        
        expect(page).to have_link("Update Artist")
      end
      it "When I click the link, I am taken to 'artists/:id/edit' page" do
        visit "/artists/#{@bone_thugs.id}"

        click_link "Update Artist"

        expect(current_path).to eq("/artists/#{@bone_thugs.id}/edit")
      end
    end
    # User Story 20
    describe "Delete Artist" do
      it "I see a Delete artist link" do
        
        visit "/artists/#{@sts9.id}"

        expect(page).to have_link("Delete #{@sts9.name}")

        visit "/artists/#{@bone_thugs.id}"

        expect(page).to have_link("Delete #{@bone_thugs.name}")
      end
      it "When I click the link, the artist is deleted and I am taken 
          to the '/artists' page, where I no longer see the artist" do
          
          visit "/artists/#{@sts9.id}"

          click_link "Delete #{@sts9.name}"

          expect(current_path).to eq("/artists")

          expect(page).to have_no_content("#{@sts9.name}")
          expect(page).to have_no_content("#{@sts9.explicit_content}")
          expect(page).to have_no_content("#{@sts9.performance_day}")
          expect(page).to have_no_content("#{@sts9.number_of_performances}")
          expect(page).to have_no_content("#{@sts9.festival_appearances}")
      end
    end
  end
end
