require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe "relationships" do
    it { should belong_to :festival }
  end
end