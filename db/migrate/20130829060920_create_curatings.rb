class CreateCuratings < ActiveRecord::Migration
  def change
    create_table :curatings do |t|
      t.references :gallery
      t.references :artwork

      t.timestamps
    end
    add_index :curatings, :gallery_id
    add_index :curatings, :artwork_id
  end
end
