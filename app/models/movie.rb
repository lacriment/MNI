class Movie < ActiveRecord::Base
	has_many :user_ratings, dependent: :destroy
	has_many :movie_genres, dependent: :destroy
	has_many :genres, through: :movie_genres
	has_many :movie_people, dependent: :destroy
	has_many :people, through: :movie_people
	#has_many :topics, through: :category_topics
end
