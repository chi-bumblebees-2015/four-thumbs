class IndexController < ApplicationController

  def welcome
    @movies = Movie.all
    @popular_movies = Movie.rank_movies
    @recent_reviews = Review.recent_reviews
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
      @nested_comments = NestedComment.all_flagged
    else
      redirect_to '/'
    end
  end

  def popular_movies
    @popular_movies = Movie.rank_movies
  end

  def popular_reviews
    @popular_reviews = Review.best_reviews
  end

  def recent_reviews
    @recent_reviews = Review.recent_reviews
  end

end
