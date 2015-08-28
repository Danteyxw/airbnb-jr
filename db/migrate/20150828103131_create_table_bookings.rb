class CreateTableBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :property_id, null: false
      t.integer :user_id, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
    end
  end
end
