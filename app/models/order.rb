class Order < ActiveRecord::Base

  validates :address, :city, :state, presence: true
  belongs_to :website

  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"

  searchkick
end
