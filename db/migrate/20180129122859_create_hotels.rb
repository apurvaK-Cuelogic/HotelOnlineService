class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.string :hotel_name
      t.string :hotel_location
      t.string :hotel_description
      t.integer :hotel_rating

      t.timestamps
    end
  end
end
