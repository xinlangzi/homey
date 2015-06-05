class RemoveCaptchaTable < ActiveRecord::Migration
  def change
    drop_table :captchas
  end
end
