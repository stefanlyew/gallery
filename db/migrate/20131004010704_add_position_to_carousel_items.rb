class AddPositionToCarouselItems < ActiveRecord::Migration
  def change
    add_column :carousel_items, :position, :integer
  end
end
