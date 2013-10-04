class Profile < ActiveRecord::Base
  attr_accessible :bibliography, :contact, :news, :photo, :quote, :recent_exhibits, :resume, :statement
  has_attached_file :photo
  has_attached_file :resume
end
