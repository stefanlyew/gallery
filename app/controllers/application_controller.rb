class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :featured_galleries

    def featured_galleries
		Gallery.where("featured = ?", true).order("position").all
    end

end
