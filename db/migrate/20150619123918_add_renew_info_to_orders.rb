class AddRenewInfoToOrders < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.integer :renewal_lease_month
      t.integer :renewal_internet_month
      t.datetime :renew_lease_at
      t.datetime :renew_internet_at
    end
  end
end
