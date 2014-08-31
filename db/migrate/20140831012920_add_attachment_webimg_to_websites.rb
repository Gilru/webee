class AddAttachmentWebimgToWebsites < ActiveRecord::Migration
  def self.up
    change_table :websites do |t|
      t.attachment :webimg
    end
  end

  def self.down
    remove_attachment :websites, :webimg
  end
end
