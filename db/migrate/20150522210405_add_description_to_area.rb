class AddDescriptionToArea < ActiveRecord::Migration
  def change
    add_column :areas, :description, :string
  end
end
