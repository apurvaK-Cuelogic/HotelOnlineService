class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.integer :room_price
      t.integer :room_rating
      t.string :room_description
      t.integer :no_of_bedrooms
      t.date :inactive_date

      t.timestamps
    end
  end
end
