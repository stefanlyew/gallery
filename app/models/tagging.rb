class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :artwork
  # attr_accessible :title, :body
end
