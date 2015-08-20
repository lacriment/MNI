class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
  end

  def rate
    if current_user
      movie = Movie.find(params[:movie_id])
      rating = current_user.user_ratings.where(movie_id: movie.id).first
      if rating
        rating.update_attributes(rating: params[:point])
      else
        UserRating.create(rating: params[:point], user_id: current_user.id, movie_id: movie.id)
      end
      redirect_to movie
    else
      redirect_to movie_path(params[:movie_id])
    end
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @rating = UserRating.where(movie_id: @movie.id).average(:rating)
    if @rating
      @rating = @rating.round(1)
    else
      @rating = 0
    end
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :release_date, :plot, :cover)
    end
end
