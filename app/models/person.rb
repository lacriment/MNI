class Person < ActiveRecord::Base
	has_many :movie_people, dependent: :destroy
	has_many :movies, through: :movie_people
end
