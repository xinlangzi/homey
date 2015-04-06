class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :name
    end
    
    add_foreign_key :rental_units, :districts
  end
end
