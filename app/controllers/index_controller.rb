class IndexController < ApplicationController

  def welcome
    @movies = Movie.all
    @feature_movie = @movies.sample
    @thumbs = @feature_movie.movie_score
    if session[:user_id]
      @name = User.find(session[:user_id])
    end
  end


end
