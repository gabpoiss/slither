class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :snake, foreign_key: true
      t.boolean :confirmed
      t.date :from
      t.date :until

      t.timestamps
    end
  end
end
