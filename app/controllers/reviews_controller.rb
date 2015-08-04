class ReviewsController < ApplicationController

	def index
	end

	def show
		@review = Review.find(params[:id])
		@movie = @review.movie

	end


	def new
    @movie = Movie.find(params[:movie_id])
	  @review = Review.new
    if !current_user
      redirect_to '/login'
    end
	end


	def create
		if current_user
      @movie = Movie.find(params[:movie_id])
      @review = @movie.reviews.new(review_params)
      @review.user = current_user
      if @review.save
        redirect_to [@movie, @review]
      else
        @error = "Could not save review. Please revise."
        render "new"
      end
    else
      redirect_to '/login'
    end
	end



	def edit
    @review = Review.find(params[:id])
    if current_user != @review.user
      redirect_to [@review.movie, @review]
    end
	end


	def update
    @review = Review.find(params[:id])
    if current_user == @review.user
  		if @review.update(review_params)
  			redirect_to [@review.movie, @review]
  		else
  			render "edit"
  		end
    else
      redirect_to [@review.movie, @review]
    end
	end



	private

	def review_params
		params.require(:review).permit(:content, :title, :rating)
	end
end
