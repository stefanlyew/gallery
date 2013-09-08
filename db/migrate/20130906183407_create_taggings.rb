class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :tag
      t.references :artwork

      t.timestamps
    end
    add_index :taggings, :tag_id
    add_index :taggings, :artwork_id
  end
end
