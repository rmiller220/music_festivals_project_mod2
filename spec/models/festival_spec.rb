require 'rails_helper'

RSpec.describe Festival, type: :model do
  describe "Festival Model" do
    before(:each) do
      Artist.delete_all
      Festival.delete_all
      @festivals = Festival.all 
      @summer_camp = Festival.create!(name: "Summer Camp Music Festival",
                                      city: "Chillicothe, IL",
                                      kid_friendly: true,
                                      ticket_price: 600,
                                      dates: "May 26th - 28th, 2023",
                                      rv_hookup: false,
                                      created_at: 2.days.ago)
      @all_good = Festival.create!(name: "All Good Music Festival",
                                  city: "Masontown, WV",
                                  kid_friendly: true,
                                  ticket_price: 550,
                                  dates: "July 15th - 17th, 2023",
                                  rv_hookup: false,
                                  created_at: 1.days.ago)
      @arise = Festival.create!(name: "Arise Music Festival",
                                city: "Loveland, CO",
                                kid_friendly: true,
                                ticket_price: 400,
                                dates: "August 2nd - 4th, 2023",
                                rv_hookup: true,
                                created_at: 3.days.ago)
      @sts9 = @summer_camp.artists.create!(name: "STS9",
                                          explicit_content: false,
                                          performance_day: "Friday, Saturday",
                                          number_of_performances: 2,
                                          festival_appearances: 10)
      @les = @all_good.artists.create!(name: "Les Claypool",
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
    describe "relationships" do
      it { should have_many :artists }
    end
  #   User Story 6
    describe "As a visitor, when I visit the parent index" do 
        
      it 'I see that records are ordered by most recently created first' do
        
        expect(@festivals.sort_by_most_recent).to eq([@all_good, @summer_camp, @arise])
      end
    end

    describe "instance methods" do   
      
      it "should #artist_count" do
        expect(@summer_camp.artist_count).to eq(2)
        expect(@all_good.artist_count).to eq(2)
      end
    end
  end
end