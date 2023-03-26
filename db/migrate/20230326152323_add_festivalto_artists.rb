class AddFestivaltoArtists < ActiveRecord::Migration[5.2]
  def change
    add_reference :artists, :festival, foreign_key: true
  end
end
