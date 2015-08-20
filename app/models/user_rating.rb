class UserRating < ActiveRecord::Base
	belongs_to :user
	belongs_to :movie
	
	after_save :calculate_average

	def calculate_average
		movie.update_attributes(average: movie.user_ratings.average(:rating))
	end
end