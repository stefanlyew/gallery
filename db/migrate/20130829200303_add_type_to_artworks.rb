class AddTypeToArtworks < ActiveRecord::Migration
  def change
  	remove_column :artworks, :year
  	add_column :artworks, :type, :string
  	add_column :artworks, :year, :integer
  end
end