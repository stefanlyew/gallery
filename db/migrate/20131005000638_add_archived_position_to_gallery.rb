class AddArchivedPositionToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :archiveposition, :integer
  end
end
