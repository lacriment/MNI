class Genre < ActiveRecord::Base
  has_many :movie_genres, dependent: :destroy
	has_many :movies, through: :movie_genres
end
