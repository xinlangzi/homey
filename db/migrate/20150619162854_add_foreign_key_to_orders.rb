class AddForeignKeyToOrders < ActiveRecord::Migration
  def change
    order_ids = select_values("select id from orders where property_id not in (select id from properties)")
    unless order_ids.empty?
      execute("delete from charges where order_id in (#{order_ids.join(',')})")
      execute("delete from orders where id in (#{order_ids.join(',')})")
    end
    add_foreign_key :orders, :properties
  end
end
