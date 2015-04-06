class AddFurnitureToRentalUnits < ActiveRecord::Migration
  def change
    change_table :rental_units do |t|
      t.boolean "Furniture Tableware Set", null: false, default: false
      t.boolean "Furniture Air Conditioning", null: false, default: false
      t.boolean "Furniture Stero", null: false, default: false
      t.boolean "Furniture Refrigerator", null: false, default: false
      t.boolean "Furniture Telephone", null: false, default: false
      t.boolean "Furniture TV", null: false, default: false
      t.boolean "Furniture LED TV", null: false, default: false
      t.boolean "Furniture Satellite TV", null: false, default: false
      t.boolean "Furniture Oven", null: false, default: false
      t.boolean "Furniture Built-In Oven", null: false, default: false
      t.boolean "Furniture Microwave Oven", null: false, default: false
      t.boolean "Furniture Washing Machine", null: false, default: false
      t.boolean "Furniture Vacuum Cleaner", null: false, default: false
      t.boolean "Furniture Coffeemaker", null: false, default: false
      t.boolean "Furniture Heating System", null: false, default: false
      t.boolean "Furniture Shower Heater", null: false, default: false
      t.boolean "Furniture Couch", null: false, default: false
      t.boolean "Furniture Wardrobe", null: false, default: false
      t.boolean "Furniture Built-In Wardrobe", null: false, default: false
      t.boolean "Furniture Shoe Cabinet", null: false, default: false
      t.boolean "Furniture Coffee Table", null: false, default: false
      t.boolean "Furniture Dining Table & Chairs", null: false, default: false
      t.boolean "Furniture Book Cabinet", null: false, default: false
      t.boolean "Furniture Beds", null: false, default: false
      t.boolean "Furniture Desk", null: false, default: false
      t.boolean "Furniture Internet", null: false, default: false
    end
  end
end
