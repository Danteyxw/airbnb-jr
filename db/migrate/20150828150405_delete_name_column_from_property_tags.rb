class DeleteNameColumnFromPropertyTags < ActiveRecord::Migration
  def change
    remove_column :property_tags, :name
  end
end
