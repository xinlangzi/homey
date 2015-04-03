class CreateFriendlyIdSlugs < ActiveRecord::Migration
  def change
    create_table :friendly_id_slugs do |t|
      t.string   :slug,           :null => false
      t.integer  :sluggable_id,   :null => false
      t.string   :sluggable_type, :limit => 50
      t.string   :scope
      t.datetime :created_at
    end
    add_index :friendly_id_slugs, :sluggable_id
    add_index :friendly_id_slugs, [:slug, :sluggable_type]
    add_index :friendly_id_slugs, [:slug, :sluggable_type, :scope], :unique => true
    add_index :friendly_id_slugs, :sluggable_type
    change_column_null :rental_units, :property_id, false
    change_table :rental_units do |t|
      t.string :slug
    end
  
    add_index :rental_units, :slug, unique: true
    change_column_null :photos, :rental_unit_id, false
  end
end
