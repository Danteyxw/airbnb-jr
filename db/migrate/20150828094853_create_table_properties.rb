class CreateTableProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.decimal :rate, precision: 11, scale:3, null: false
      t.integer :capacity, null: false
    end
  end
end
