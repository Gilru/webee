class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :name
      t.string :url
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
