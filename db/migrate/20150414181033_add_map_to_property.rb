class AddMapToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :map, :string
  end
end
