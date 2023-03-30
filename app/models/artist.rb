class Artist < ApplicationRecord
  belongs_to :festival 
  # scope :explicit_content, -> {where(explicit_content: true)} 
  def self.explicit_true?
    Artist.where(explicit_content: true)
  end
end