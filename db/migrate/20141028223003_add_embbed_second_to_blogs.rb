class AddEmbbedSecondToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :embbedsecond, :text
  end
end
