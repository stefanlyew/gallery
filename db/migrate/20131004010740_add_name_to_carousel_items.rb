class AddNameToCarouselItems < ActiveRecord::Migration
  def change
    add_column :carousel_items, :name, :string
  end
end
