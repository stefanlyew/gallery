class Gallery < ActiveRecord::Base
  attr_accessible :description, :title, :artwork_ids
  has_many :curatings
  has_many :artworks, through: :curatings 
end
