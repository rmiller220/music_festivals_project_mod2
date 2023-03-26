class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.boolean :explicit_content
      t.string :performance_day
      t.integer :number_of_performances
      t.integer :festival_appearances
      # t.references :festival, foreign_key: true

      t.timestamps
    end
  end
end
