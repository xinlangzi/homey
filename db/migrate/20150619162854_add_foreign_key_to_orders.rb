class AddForeignKeyToOrders < ActiveRecord::Migration
  def change
    execute("delete from orders where property_id not in (select id from properties)")
    add_foreign_key :orders, :properties
  end
end
