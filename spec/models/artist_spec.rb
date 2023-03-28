require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe "relationships" do
    it { should belong_to :festival }
  end

  describe "#explicit_true?" do
  before(:each) do
    Artist.delete_all
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
                                         festival_appearances: 10)
    @bone_thugs = @summer_camp.artists.create!(name: "Bone Thugs in Harmony",
                                              explicit_content: true,
                                              performance_day: "Sunday",
                                              number_of_performances: 1,
                                              festival_appearances: 3,
                                              festival: @summer_camp)
    end
    it "checks explicit_true? method" do
    
      expect(Artist.explicit_true?).to eq([@bone_thugs])
      # expect(@sts9.explicit_true?).to !eq(@sts9.explicit_content)
    end
  end
end