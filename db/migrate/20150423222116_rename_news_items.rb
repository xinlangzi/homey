class RenameNewsItems < ActiveRecord::Migration
  def change
    rename_table :news_items, :posts
    add_column :posts, :type, :string
    execute("update posts set type = 'NewsItem'")
    change_column_null :posts, :type, false
  end
end
