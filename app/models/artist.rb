class Artist < ApplicationRecord
  belongs_to :festival 
  # scope :explicit_content, -> {where(explicit_content: true)} 
  def self.explicit_true?
    # require 'pry'; binding.pry
  
    Artist.where(explicit_content: true)
    # select * from self where explicit_content = 'true'
    # Arist.where("explicit_content IN 'True'")
    # Artist.where(artist_id: id).where("explicit_content IN 'true'")
  end
end