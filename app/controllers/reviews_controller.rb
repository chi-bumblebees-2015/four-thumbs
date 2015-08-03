class ReviewsController < ApplicationController
	before_action :find_movie except: [:index]

	def index
	end

	def show
		@review = Review.find(params[:id])

	end


	def new
	## USER LINK? ## USER SESSION
	  @review = Review.new
	end


	def create
		## USER LINK? ## USER SESSION
	  	@review = @movie.reviews.new(review_params)


	  	if @review.save
	  		redirect_to [@movie, @review]
	  	else
	  		@error = "Could not save review. Please revise."
	  		render "new"
	  	end

	end



	def edit

	end

	def update
		if @review.update(review_params)
			redirect_to [@movie, @review]
		else
			render "edit"
		end
	end



	private

	def review_params
		params.require(:review).permit(:content, :title, :rating)
	end

	def find_movie
		@movie = Movie.find(params[:id])
	end




end
