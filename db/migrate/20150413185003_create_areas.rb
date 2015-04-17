class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
    
    add_column :properties, :area_id, :integer
    add_foreign_key :properties, :areas
  end
end
