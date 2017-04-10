class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :snake, foreign_key: true
      t.boolean :confirmed
      t.datetime :from
      t.datetime :until

      t.timestamps
    end
  end
end
