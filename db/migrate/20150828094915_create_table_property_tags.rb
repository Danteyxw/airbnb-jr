class CreateTablePropertyTags < ActiveRecord::Migration
  def change
    create_table :property_tags do |t|
      t.string :name, null: false
      t.integer :property_id, null: false
      t.integer :tag_id, null: false
    end
  end
end
