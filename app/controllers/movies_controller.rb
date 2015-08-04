class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    @thumbs = @movie.movie_score
  end

end
