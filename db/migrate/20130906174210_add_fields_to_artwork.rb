class AddFieldsToArtwork < ActiveRecord::Migration
  def change
    add_column :artworks, :notes, :text
    add_column :artworks, :sold, :boolean
    add_column :artworks, :datesold, :date
    add_column :artworks, :soldto, :string
  end
end
