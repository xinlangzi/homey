class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :mobile_phone
      t.text :comment, null: false
      t.string :property_id
      t.timestamps null: false
    end
  end
end
