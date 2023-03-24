class Festival < ApplicationRecord
  has_many :artists
  def self.sort_by_most_recent
    ordered(created_at: :desc)
  end
end