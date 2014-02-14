class AddGalleryIdToCarouselItems < ActiveRecord::Migration
  def change
    add_column :carousel_items, :gallery_id, :integer
  end
end
