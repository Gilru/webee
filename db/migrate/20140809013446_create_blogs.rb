class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :sub_title
      t.text :content

      t.timestamps
    end
  end
end
