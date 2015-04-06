class RefinePropertiesTable < ActiveRecord::Migration
  def change
    drop_table :photos
    drop_table :properties
    create_table :images do |t|
      t.string   :file
      t.string   :imageable_type
      t.integer  :imageable_id
      t.references :user
      t.timestamps
    end

    create_table :properties do |t|
      t.references  :district
      t.string   :title
      t.string   :property_id, null: false
      t.integer  :category
      t.decimal  :price
      t.integer  :dens
      t.integer  :bedrooms
      t.integer  :bathrooms
      t.integer  :storage_rooms
      t.float    :surface_area
      t.boolean  :utility_charge_included
      t.boolean  :short_term_lease
      t.text     :business_center
      t.date     :available_date, null: false
      t.string   :slug
      t.timestamps
    end

    (1..59).each do |i|
      add_column :properties, "boolean#{i}".to_sym, :boolean, default: false, null: false
    end

    (1..8).each do |i|
      add_column :properties, "km#{i}".to_sym, :decimal, precision: 10, scale: 2
    end

    add_index :properties, :slug, unique: true
  end
end
