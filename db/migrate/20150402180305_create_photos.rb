class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :file
      t.references :rental_unit
      t.timestamps null: false
    end
    
    add_foreign_key :photos, :rental_units
  end
end
