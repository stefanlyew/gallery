class Artwork < ActiveRecord::Base
  attr_accessible :medium, :price, :size, :title, :year, :asset, :category, :gallery_ids, :notes, :tag_list, :datesold, :soldto, :sold
  attr_accessible :asset_content_type, :asset_file_name, :asset_file_size, :asset_updated_at, :asset
  before_create :default_title
  
 has_attached_file :asset, styles: { thumbnail: "300x200#" }
  #todo add style resize but don't crop

  has_many :curatings, dependent: :destroy
  has_many :galleries, through: :curatings
  has_many :taggings
  has_many :tags, through: :taggings
  before_save { |artwork| artwork.medium = medium.to_s.chomp(' ').chomp('.').chomp(' ').chomp('.') }

  def filename
    asset.instance_read(:file_name)
  end

  def default_title
    self.title ||= File.basename(filename, '.*').titleize if asset
    self.title = File.basename(filename, '.*').titleize if asset && self.title.empty?
  end

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

  def price
     "$%.2f" % self[:price] if self[:price]
  end

  def to_jq_upload
    {
      "name" => read_attribute(:asset_file_name),
      "size" => read_attribute(:asset_file_size),
      "url" => asset.url(:original),
      "thumbnail_url" => asset.url(:thumb),
      "delete_url" => "/artworks/#{self.id}",
      "delete_type" => "DELETE" 
    }
  end

end
