class Curating < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :artwork
  # attr_accessible :title, :body
end
