class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :checkinDate
      t.date :checkoutDate
      t.date :bookingDate

      t.timestamps
    end
  end
end
