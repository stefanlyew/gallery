class RemoveCaptionFromCarouselItems < ActiveRecord::Migration
  def up
    remove_column :carousel_items, :caption
  end

  def down
    add_column :carousel_items, :caption, :string
  end
end
