class CreateRentalUnits < ActiveRecord::Migration
  def change
    create_table :rental_units do |t|
      t.string :title
      t.string :property_id
      t.decimal :price
      t.integer :number_of_bedrooms
      t.integer :number_of_bathrooms
      t.integer :number_of_dens
      t.integer :number_of_storage_rooms
      t.float :surface_area
      t.boolean :utility_charge_included
      t.references :district
      t.boolean :short_term_lease
      t.text :business_center
      t.date :available_date
      t.timestamps null: false
    end
    
    add_index :rental_units, :property_id, unique: true
  end
end
