class AddTransportationToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :transportation, :text
  end
end
