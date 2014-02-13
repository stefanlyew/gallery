class Gallery < ActiveRecord::Base
  attr_accessible :description, :title, :artwork_ids, :quote, :featured, :archived, :nav_id
  belongs_to :nav
  has_many :curatings, dependent: :destroy
  has_many :artworks, through: :curatings

  def self.featured
  	self.where("featured = ?", true).order("position")
  end

  def self.archived
  	self.where("archived = ?", true).order("archiveposition")
  end
end
