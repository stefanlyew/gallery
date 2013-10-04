class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :quote
      t.text :statement
      t.text :recent_exhibits
      t.text :news
      t.text :bibliography
      t.text :contact
      t.attachment :resume
      t.attachment :photo

      t.timestamps
    end
  end
end
