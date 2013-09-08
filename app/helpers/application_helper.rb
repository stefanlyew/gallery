module ApplicationHelper
	def big_tag_list
		Tag.all.map { |tag| tag.name }
	end

    def featured_galleries
		Gallery.featured.all
    end
end
