class Blog < ActiveRecord::Base

  belongs_to :user
  if Rails.env.development?
    has_attached_file :image, styles: {medium: "649x476>", thumb: "100x100>"}
  else
    has_attached_file :image, styles: {medium: "649x476>", thumb: "100x100>"},
                      storage: :dropbox,
                      dropbox_credentials: Rails.root.join("config/dropbox.yml"),
                      path: ":style/:id_:filename"
  end


  validates_attachment :image, content_type: {content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]}
  validates_attachment_presence :image


  validates :content, :sub_title, :title, presence: true
  validates :title, :sub_title, length: {maximum: 30}

  def image_url
    image.url(:medium)
  end

  def profileimg_url
    user.profileimg.url(:medium)
  end



  searchkick


end
