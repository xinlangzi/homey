class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.string :logo
      t.string :slogan
      t.string :phone
      t.string :email
      t.timestamps null: false
    end
  end
end
