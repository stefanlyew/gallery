class AddFieldsToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :featured, :boolean
    add_column :galleries, :quote, :text
  end
end
