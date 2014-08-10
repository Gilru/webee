class Blog < ActiveRecord::Base

  belongs_to :user
  has_attached_file :image, styles: { medium: "649x476>", thumb: "100x100>" },
                    storage: :dropbox,
                    dropbox_credentials: Rails.root.join("config/dropbox.yml")


  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment_presence :image



  validates :content,:sub_title,:title, presence: true
  validates :title,:sub_title, length: {in: 3..30}


end
