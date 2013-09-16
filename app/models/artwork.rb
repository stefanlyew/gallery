class Artwork < ActiveRecord::Base
  attr_accessible :medium, :price, :size, :title, :year, :asset, :category, :gallery_ids, :notes, :tag_list, :datesold, :soldto, :sold
  has_attached_file :asset, styles: { thumbnail: "300x200#" }
  has_many :curatings, dependent: :destroy
  has_many :galleries, through: :curatings
  has_many :taggings
  has_many :tags, through: :taggings
  before_save { |artwork| artwork.medium = medium.chomp(' ').chomp('.').chomp(' ').chomp('.') }

  def tag_list
    tags.join(", ")
  end

  def tag_list=(tags_string)
  	tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
  	new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by_name(name) }
  	self.tags = new_or_found_tags
  end

  def caption
    "\"#{title}\", #{year}. #{medium}. #{size}. Margaret Tsirantonakis. " 
  end

end
