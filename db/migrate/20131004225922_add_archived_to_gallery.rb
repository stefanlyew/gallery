class AddArchivedToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :archived, :boolean
  end
end
