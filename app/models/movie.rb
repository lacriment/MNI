class Movie < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_many :user_ratings, dependent: :destroy
	has_many :movie_genres, dependent: :destroy
	has_many :genres, through: :movie_genres
	has_many :movie_people, dependent: :destroy
	has_many :people, through: :movie_people
	has_many :directors, -> { where("role = ?", "Director")}, through: :movie_people, source: :person
	has_many :actors, -> { where("role = ?", "Actor")}, through: :movie_people, source: :person
	has_many :producers, -> { where("role = ?", "Producer")}, through: :movie_people, source: :person
	has_many :musicians, -> { where("role = ?", "Musician")}, through: :movie_people, source: :person
	has_many :writers, -> { where("role = ?", "Writer")}, through: :movie_people, source: :person

	#has_many :topics, through: :category_topics
end
