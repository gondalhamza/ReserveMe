class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.integer :guest_id
      t.integer :hotel_id
      t.date :arrival_date
      t.date :departure_date
      t.integer :number_of_rooms

      t.timestamps
    end
  end
end
