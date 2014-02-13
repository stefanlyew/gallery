class AddNavIdToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :nav_id, :integer
  end
end
