class ChangeTypeOfPropertyIdInOrders < ActiveRecord::Migration
  def change
    change_column :orders, :property_id, :integer, cast_as: "int"
    change_column_null :orders, :property_id, false
  end
end
