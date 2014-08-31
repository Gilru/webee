class Website < ActiveRecord::Base

  has_attached_file :webimg, styles: { medium: "649x476>", thumb: "100x100>" }
else
  has_attached_file :webimg, styles: { medium: "649x476>", thumb: "100x100>" },
                    storage: :dropbox,
                    dropbox_credentials: Rails.root.join("config/dropbox.yml"),
                    path: ":style/:id_:filename"


  validates_attachment :webimg, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment_presence :webimg

end
