class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.references :order, index: true, foreign_key: true
      t.integer :category
      t.decimal :amount
      t.text :note
      t.boolean :paid

      t.timestamps null: false
    end
  end
end
