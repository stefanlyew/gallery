class Nav < ActiveRecord::Base
  attr_accessible :title, :featured
  has_many :galleries

  def self.featured
  	self.where("featured = ?", true).order("position")
  end

end
