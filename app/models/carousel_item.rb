class CarouselItem < ActiveRecord::Base
  attr_accessible :asset, :caption, :name, :gallery_id
  belongs_to :gallery
  has_attached_file :asset, styles: { thumbnail: "200x100#" }
end
