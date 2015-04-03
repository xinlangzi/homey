class RenameRentalUnit < ActiveRecord::Migration
  def change
    rename_table :rental_units, :properties
    rename_column :photos, :rental_unit_id, :property_id
  end
end
