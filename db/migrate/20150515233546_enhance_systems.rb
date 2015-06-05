class EnhanceSystems < ActiveRecord::Migration
  def change
    add_column :systems, :our_service, :text
    add_column :systems, :contact_us, :text
    add_column :systems, :to_be_vip, :text
    add_column :systems, :escape_clause, :text
    add_column :systems, :faq_to_owner, :text
  end
end
