module ApplicationHelper
	def sortable(column, title = nil)
	  title ||= column.titleize
	  css_class = column == sort_column ? "current #{sort_direction}" : nil
	  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
	  link_to title, {:sort => column, :direction => direction}, {:class => css_class}
	end

	def big_tag_list
		Tag.all.map { |tag| tag.name }
	end

    def featured_galleries
		Gallery.featured.all
    end
end
