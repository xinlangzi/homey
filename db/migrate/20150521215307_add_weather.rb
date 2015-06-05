class AddWeather < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.integer :temp_c, limit: 1
      t.integer :temp_f, limit: 1
      t.string :icon
    end
  end
end
