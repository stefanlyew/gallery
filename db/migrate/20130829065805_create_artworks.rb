class CreateArtworks < ActiveRecord::Migration
  def change
    drop_table :artworks
    create_table :artworks do |t|
      t.string :title
      t.date :year
      t.string :size
      t.float :price
      t.string :medium

      t.timestamps
    end

    add_attachment :artworks, :asset
  end
end
