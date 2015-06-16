class AddTwoPropertyAttributes < ActiveRecord::Migration
  def change
    add_column :properties, :boolean60, :boolean, default: false, null: false
    add_column :properties, :boolean61, :boolean, default: false, null: false
    add_column :images, :default_image, :boolean, default: false, null: false
    
    Property.all.each do |property|
      property.images.first.update_attributes!(default_image: true)
    end
  end
end
