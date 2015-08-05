class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    @thumbs = @movie.movie_score
  end

  def new
    @movie = Movie.new
    if !current_user
      redirect_to '/login'
    end
  end

  def create
    if current_user
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
