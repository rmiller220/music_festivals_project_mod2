class CreateFestivals < ActiveRecord::Migration[5.2]
  def change
    create_table :festivals do |t|
      t.string :city
      t.string :name
      t.boolean :kid_friendly
      t.integer :ticket_price
      t.string :dates
      t.boolean :rv_hookup
      
      t.timestamps
    end
  end
end
