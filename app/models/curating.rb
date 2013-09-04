class Curating < ActiveRecord::Base
  attr_accessible :doc_id, :article_id, :position
  belongs_to :gallery
  belongs_to :artwork
  acts_as_list #:scope => :gallery
end
