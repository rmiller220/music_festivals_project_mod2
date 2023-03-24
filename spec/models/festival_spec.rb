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
    before(:each) do 
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
    end
    it 'I see that records are ordered by most recently created first' do
      # require 'pry'; binding.pry
      expect(@festivals.sort_by_most_recent).to eq([@all_good, @summer_camp, @arise])
    end

    it 'next to each of the records, I see when it was created'
  end
end