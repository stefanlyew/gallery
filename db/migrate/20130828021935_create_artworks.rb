class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.references :album
      t.string :title
      t.integer :year
      t.string :type
      t.string :medium
      t.string :size
      t.integer :price
      t.string :notes

      t.timestamps
    end
    add_index :artworks, :album_id
    add_attachment :artworks, :asset
  end
end
