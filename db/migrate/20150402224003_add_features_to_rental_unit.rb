class AddFeaturesToRentalUnit < ActiveRecord::Migration
  def change
    change_table :rental_units do |t|
      t.boolean "Feature Open Kitchen", null: false, default: false
      t.boolean "Feature Newly Renovated", null: false, default: false
      t.boolean "Feature Big Balcony", null: false, default: false
      t.boolean "Feature Shower Separation", null: false, default: false
      t.boolean "Feature Bath Tub", null: false, default: false
      t.boolean "Feature Fully Furnished", null: false, default: false
      t.boolean "Feature Unfurnished", null: false, default: false
      t.boolean "Feature WIFI", null: false, default: false
      t.boolean "Feature Sea View", null: false, default: false
      t.boolean "Feature Lake View", null: false, default: false
      t.boolean "Feature Double Glazing", null: false, default: false
      t.boolean "Feature Compound", null: false, default: false
      t.boolean "Feature With Garden", null: false, default: false
      t.boolean "Feature Duplex", null: false, default: false
      t.boolean "Feature With Terrace", null: false, default: false
      t.boolean "Feature Central AC", null: false, default: false
      t.boolean "Feature Bright & With Natural Light", null: false, default: false
    end
  end
end
