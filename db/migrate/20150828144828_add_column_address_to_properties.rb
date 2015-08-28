class AddColumnAddressToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :address, :integer, null: false
  end
end
