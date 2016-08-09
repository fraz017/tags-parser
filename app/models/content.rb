class Content < ActiveRecord::Base
	serialize :h1, Array
	serialize :h2, Array
	serialize :h3, Array
	serialize :extracted_hrefs, Array
end
