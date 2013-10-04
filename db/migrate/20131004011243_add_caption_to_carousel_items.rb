class AddCaptionToCarouselItems < ActiveRecord::Migration
  def change
    add_column :carousel_items, :caption, :text
  end
end
