class AddWebsiteIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :website_id, :integer
  end
end
