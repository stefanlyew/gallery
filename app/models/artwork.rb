class Artwork < ActiveRecord::Base
  attr_accessible :medium, :price, :size, :title, :year, :asset, :category
  has_attached_file :asset
  #has_many :curatings
  #has_many :galleries, though: :curatings
end
