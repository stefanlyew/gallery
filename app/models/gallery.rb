class Gallery < ActiveRecord::Base
  attr_accessible :description, :title, :artwork_ids
  has_many :curatings, dependent: :destroy
  has_many :artworks, through: :curatings #, :order => 'curatings.position'
end
