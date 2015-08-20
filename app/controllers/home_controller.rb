class HomeController < ApplicationController
	def index
    @movies = Movie.all.sample(3)
    @topmovies = Movie.order("average DESC")
  end
end
