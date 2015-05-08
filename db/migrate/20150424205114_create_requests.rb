class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :kind, null: false, limit: 1
      t.integer :intention, limit: 1
      t.integer :category, limit: 1
      t.integer :bathroom_count, limit: 1
      t.integer :bedroom_count, limit: 1
      t.integer :budget
      t.date :start_of_lease
      t.date :end_of_lease
      t.string :name, null: false
      t.string :email, null: false
      t.string :mobile_phone, null: false
      t.text :comments
      t.timestamps null: false
    end
  end
end
