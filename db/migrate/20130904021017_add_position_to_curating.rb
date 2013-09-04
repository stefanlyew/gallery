class AddPositionToCurating < ActiveRecord::Migration
  def change
    add_column :curatings, :position, :integer
  end
end
