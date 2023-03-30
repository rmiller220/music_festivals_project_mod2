class Festival < ApplicationRecord
  has_many :artists
  def self.sort_by_most_recent
    order(created_at: :desc)
  end

  def artist_count
    artists.size
  end

  def sort_festivals
    artists.order(:name)
  end
end