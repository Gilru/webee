class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :progress
      t.string :link

      t.timestamps
    end
  end
end
