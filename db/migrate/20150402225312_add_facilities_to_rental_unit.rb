class AddFacilitiesToRentalUnit < ActiveRecord::Migration
  def change
    change_table :rental_units do |t|
      t.boolean "Facility XIS Bus Stop", null: false, default: false
      t.boolean "Facility Childrens Playground", null: false, default: false
      t.boolean "Facility Golf Course", null: false, default: false
      t.boolean "Facility Outdoor Swimming Pool", null: false, default: false
      t.boolean "Facility Indoor Swimming Pool", null: false, default: false
      t.boolean "Facility Gym", null: false, default: false
      t.boolean "Facility Cafes", null: false, default: false
      t.boolean "Facility Beer Bars", null: false, default: false
      t.boolean "Facility Assembly Room", null: false, default: false
      t.boolean "Facility Western Restaurants", null: false, default: false
      t.boolean "Facility Tennis Court", null: false, default: false
      t.boolean "Facility 24-hour Management & Security Service", null: false, default: false
      t.boolean "Facility Parking Space", null: false, default: false
      t.boolean "Facility Snooker", null: false, default: false
      t.boolean "Facility Salon", null: false, default: false
      t.boolean "Facility Park", null: false, default: false
    end
  end
end
