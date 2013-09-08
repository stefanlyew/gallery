class Gallery < ActiveRecord::Base
  attr_accessible :description, :title, :artwork_ids, :quote, :featured
  has_many :curatings, dependent: :destroy
  has_many :artworks, through: :curatings

  def self.featured
  	self.where("featured = ?", true).order("position")
  end
end
