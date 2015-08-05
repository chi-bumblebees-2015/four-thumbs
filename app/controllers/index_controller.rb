class IndexController < ApplicationController

  def welcome
    @movies = Movie.all
    @feature_movie = @movies.sample
    @thumbs = @feature_movie.movie_score
    if session[:user_id]
      @name = User.find(session[:user_id])
    end
  end

  def alphabetical
    @movies = Movie.alphabetic
  end

  def admin
    if current_user.admin == true
      @comments = Comment.all_flagged
      @reviews = Review.all_flagged
    else
      redirect_to '/'
    end
  end

end
