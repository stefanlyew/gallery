class Gallery < ActiveRecord::Base
  attr_accessible :description, :title
  #has_many :curatings
  #has_many :artworks, through: :curatings 
end
