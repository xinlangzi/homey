class AddCaptcha < ActiveRecord::Migration
  def change
    create_table :captchas do |t|
      t.string :question
      t.string :answer
    end
  end
end
