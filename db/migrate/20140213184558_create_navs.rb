class CreateNavs < ActiveRecord::Migration
  def change
    create_table :navs do |t|
      t.string :title

      t.timestamps
    end
  end

end
