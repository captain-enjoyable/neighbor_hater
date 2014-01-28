class Comment < ActiveRecord::Base
	attr_accessible :headline, :body
	belongs_to :location
end