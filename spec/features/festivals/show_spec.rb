require 'rails_helper'

RSpec.describe "/festivals", type: :feature do
  describe "Festival Show Page" do
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
    #User Story 2
    describe "as a visitor, when I visit the festivals/:id" do
      it 'I see the Festival with that id, including its attributes' do

        visit "/festivals/#{@summer_camp.id}"

        expect(page).to have_content("#{@summer_camp.name}")
        expect(page).to have_content("City/State: #{@summer_camp.city}")
        expect(page).to have_content("Are we kid friendly? #{@summer_camp.kid_friendly}")
        expect(page).to have_content("Ticket Price: #{@summer_camp.ticket_price}")
        expect(page).to have_content("Dates: #{@summer_camp.dates}")
        expect(page).to have_content("RV Hookup? #{@summer_camp.rv_hookup}")

        visit "/festivals/#{@all_good.id}"

        expect(page).to have_content("#{@all_good.name}")
        expect(page).to have_content("City/State: #{@all_good.city}")
        expect(page).to have_content("Are we kid friendly? #{@all_good.kid_friendly}")
        expect(page).to have_content("Ticket Price: #{@all_good.ticket_price}")
        expect(page).to have_content("Dates: #{@all_good.dates}")
        expect(page).to have_content("RV Hookup? #{@all_good.rv_hookup}")
      end
    end

    #User story 7
    describe "As a visitor, when I visit a parents show page" do
      it "I see a count of the number of artists associated with the festival" do
        visit "/festivals/#{@summer_camp.id}"

          expect(page).to have_content("Total Artists Performing at #{@summer_camp.name}: #{@summer_camp.artist_count}")
      end
    end
    #User story 19
    describe "when I visit '/festivals/:id' delete festival link" do
      it "I see a link to delete a festival" do
        visit "/festivals/#{@summer_camp.id}"

        expect(page).to have_link("Delete #{@summer_camp.name}")
      end
      
      it "click delete link, and festival is deleted" do
        visit "/festivals/#{@summer_camp.id}"

        click_link "Delete #{@summer_camp.name}"

        expect(current_path).to eq("/festivals")
        
        expect(page).to have_no_content(@summer_camp.name)
      end
    end
  end
end

# User Story 19, Parent Delete 

# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent