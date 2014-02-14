class Nav < ActiveRecord::Base
  attr_accessible :title, :featured
  has_many :galleries
  has_one :carousel_item

  def self.featured
  	self.where("featured = ?", true).order("position")
  end

end
