class Curating < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :artwork
  acts_as_list :scope => :gallery
end
