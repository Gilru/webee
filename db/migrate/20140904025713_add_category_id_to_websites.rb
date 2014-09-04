class AddCategoryIdToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :category_id, :integer
  end
end
