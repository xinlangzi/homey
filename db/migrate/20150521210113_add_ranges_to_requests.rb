class AddRangesToRequests < ActiveRecord::Migration
  def change
    change_table :requests do |t|
      t.rename :bathroom_count, :bathroom_min
      t.integer :bathroom_max, limit: 1
      t.rename :bedroom_count, :bedroom_min
      t.integer :bedroom_max, limit: 1
      t.rename :budget, :budget_min
      t.integer :budget_max
    end
  end
end
