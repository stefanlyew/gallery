class AddFieldsToNav < ActiveRecord::Migration
  def change
    add_column :navs, :featured, :boolean
    add_column :navs, :position, :integer
  end
end
