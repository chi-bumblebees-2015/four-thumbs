class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    if @movie.reviews.count > 0
      @thumbs = @movie.movie_score
    else
      @thumbs = 0
    end
  end

  def new
    @movie = Movie.new
    if !current_user || !current_user.admin
      redirect_to '/login'
    end
  end

  def create
    if current_user && current_user.admin
      @movie = Movie.new(movie_params)
      @movie.poster = Faker::Avatar.image(new_movie_name)
      if @movie.save
        redirect_to @movie
      else
        @error = "Could not save movie. Please revise."
        render 'new'
      end
    else
      redirect_to '/login'
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :plot_summary)
  end

  def new_movie_name
    movie_params[:name]
  end

end
