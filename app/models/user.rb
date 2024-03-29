class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :blogs, dependent: :destroy
  has_many :projects, dependent: :destroy

  validates :name, presence: true,
            length: {maximum: 75}
  validates :company, length: {maximum: 75}


  # ==============================profile ====================================
  if Rails.env.development?
    has_attached_file :profileimg, styles: {medium: "50x50>", thumb: "100x100>"},
                      default_url: "https://dl.dropbox.com/s/b84a5iphbzb0l3l/img_profile.png?dl=0"
  else
    has_attached_file :profileimg, styles: {medium: "50x50>", thumb: "100x100>"},
                      default_url: "https://dl.dropbox.com/s/b84a5iphbzb0l3l/img_profile.png?dl=0",
                      storage: :dropbox,
                      dropbox_credentials: Rails.root.join("config/dropbox.yml"),
                      path: ":style/:id_:filename"
  end

  validates_attachment :profileimg, content_type: {content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]}


  # ==============================profile end ====================================

  has_many :websites, dependent: :destroy
  #==================================Purchase=======================================
  has_many :sales, class_name: "Order", foreign_key: "seller_id"
  has_many :purchases, class_name: "Order", foreign_key: "buyer_id"
  #=================================================================================

  # ===============================Review=========================================
  has_many :reviews, dependent: :destroy
  searchkick
end
