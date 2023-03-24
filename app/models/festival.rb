class Festival < ApplicationRecord
  has_many :artists
  def self.sort_by_most_recent
    order(created_at: :desc)
  end
end