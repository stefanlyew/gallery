class Artwork < ActiveRecord::Base
  belongs_to :album
  attr_accessible :medium, :notes, :price, :size, :title, :type, :year
end
