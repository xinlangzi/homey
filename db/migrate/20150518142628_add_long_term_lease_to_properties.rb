class AddLongTermLeaseToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :long_term_lease, :boolean, default: true
    execute("UPDATE properties SET long_term_lease = true")
  end
end
