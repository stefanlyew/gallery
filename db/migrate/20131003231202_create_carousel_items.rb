class CreateCarouselItems < ActiveRecord::Migration
  def change
    create_table :carousel_items do |t|
      t.string :caption
      t.attachment :asset

      t.timestamps
    end
  end
end
