class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :property_id
      t.date :lease_start
      t.date :lease_end
      t.text :bank_account
      t.decimal :rent
      t.integer :period_length
      t.integer :pre_alert_day
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
