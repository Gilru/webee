class AddEmbedCodeToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :embedcode, :text
  end
end
