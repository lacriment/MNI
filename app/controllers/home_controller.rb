class HomeController < ApplicationController
	def index
    @movies = Movie.all.sample(3)
  end
end
