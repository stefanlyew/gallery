class CarouselItem < ActiveRecord::Base
  attr_accessible :asset, :caption, :name
  has_attached_file :asset, styles: { thumbnail: "200x100#" }
end
