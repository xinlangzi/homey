class ConstrainCharges < ActiveRecord::Migration
  def change
    remove_index :orders, :user_id
    change_column_null :orders, :user_id, false
    change_column_null :orders, :rent, false
    change_column_null :orders, :period_length, false
    change_column_null :orders, :pre_alert_day, false

    change_column_null :orders, :lease_start, false
    change_column_null :orders, :lease_end, false

    change_table :charges do |t|
      t.remove_index :order_id
      t.boolean :reminded, null: false, default: false
      t.date :due_date, null: false
    end
    change_column_null :charges, :order_id, false
    change_column_null :charges, :category, false
    change_column_null :charges, :amount, false
    change_column_null :charges, :paid, false
    change_column_default :charges, :paid, false
  end
end
