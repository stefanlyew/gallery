class ChangeTypeToCategoryForArtworks < ActiveRecord::Migration
  def change
  	remove_column :artworks, :type
  	add_column :artworks, :category, :string
  end
end
