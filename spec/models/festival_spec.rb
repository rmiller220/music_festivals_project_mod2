require 'rails_helper'

RSpec.describe Festival, type: :model do
  describe "relationships" do
    it { should have_many :artists }
  end
#   User Story 6, Parent Index sorted by Most Recently Created 

# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created
  describe "As a visitor, when I visit the parent index" do 
      Festival.delete_all
      Artist.delete_all
      let!(:festivals) { Festival.all }
      let!(:summer_camp) { Festival.create!(name: "Summer Camp Music Festival",
                                      city: "Chillicothe, IL",
                                      kid_friendly: true,
                                      ticket_price: 600,
                                      dates: "May 26th - 28th, 2023",
                                      rv_hookup: false,
                                      created_at: 2.days.ago)}
      let!(:all_good) { Festival.create!(name: "All Good Music Festival",
                                  city: "Masontown, WV",
                                  kid_friendly: true,
                                  ticket_price: 550,
                                  dates: "July 15th - 17th, 2023",
                                  rv_hookup: false,
                                  created_at: 1.days.ago)}
      let!(:arise) { Festival.create!(name: "Arise Music Festival",
                                          city: "Loveland, CO",
                                          kid_friendly: true,
                                          ticket_price: 400,
                                          dates: "August 2nd - 4th, 2023",
                                          rv_hookup: true,
                                          created_at: 3.days.ago)}
    it 'I see that records are ordered by most recently created first' do
      
      expect(festivals.sort_by_most_recent).to eq([all_good, summer_camp, arise])
    end
  end

  describe "instance methods" do
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
    let!(:les) { Artist.create!(name: "Les Claypool",
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
    it "should #artist_count" do
      expect(summer_camp.artist_count).to eq(2)
      expect(all_good.artist_count).to eq(2)
    end
  end
end