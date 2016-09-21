class Search
	def initialize(page, page_size, keywords)
		@page = page
		@page_size = page_size
		@offset = page_size * page
		@keywords = keywords
	end


	def brands_by_name
		if @keywords.present?
		    brands = Brand.where(name_condition).order(:name).offset(@offset).limit(@page_size)
		    @number_of_records = Brand.where(name_condition).count
	    else
		    brands = Brand.order(:name).offset(@offset).limit(@page_size)
		    @number_of_records = Brand.count
	    end
	    
	    return brands, number_of_pages
	end

	def categories_by_name
		if @keywords.present?
		    categories = Category.where(name_condition).order(:name).offset(@offset).limit(@page_size)
		    @number_of_records = Category.where(name_condition).count
	    else
		    categories = Category.order(:name).offset(@offset).limit(@page_size)
		    @number_of_records = Category.count
	    end
	    
	    return categories, number_of_pages
	end

	def towns_by_name
		if @keywords.present?
		    towns = Town.where(name_condition).order(:name).offset(@offset).limit(@page_size)
		    @number_of_records = Town.where(name_condition).count
	    else
		    towns = Town.order(:name).offset(@offset).limit(@page_size)
		    @number_of_records = Town.count
	    end
	    
	    return towns, number_of_pages
	end

	def units_by_name
		if @keywords.present?
		    units = Unit.where(name_condition).order(:name).offset(@offset).limit(@page_size)
		    @number_of_records = Unit.where(name_condition).count
	    else
		    units = Unit.order(:name).offset(@offset).limit(@page_size)
		    @number_of_records = Unit.count
	    end
	    
	    return units, number_of_pages
	end

	private

	def name_condition
		name_condition = "unaccent(lower(name)) LIKE '%#{I18n.transliterate(@keywords.downcase)}%'"
	end

	def number_of_pages
		number_of_pages = (@number_of_records % @page_size) == 0 ? 
	                        @number_of_records / @page_size - 1 : @number_of_records / @page_size
	end
end