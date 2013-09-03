class Artwork < ActiveRecord::Base
  attr_accessible :medium, :price, :size, :title, :year, :asset, :category, :gallery_ids
  has_attached_file :asset, styles: { thumbnail: "300x200#" }
  has_many :curatings
  has_many :galleries, through: :curatings
end
