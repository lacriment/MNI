class RandommovieController < ApplicationController
  def index
    @randommovie = Movie.all.sample(1)
    redirect_to movie_path(@randommovie)
  end
end
