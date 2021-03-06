class ReviewsController < ApplicationController

	def index
	end

	def show
		@review = Review.find(params[:id])
		@movie = @review.movie
    @comments = @review.unhidden_comments
    @new_comment = Comment.new
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

  def upvote
    @review = Review.find(params[:id])
    if current_user && (current_user.liked? @review)
      @review.unliked_by current_user
    elsif current_user
      @review.liked_by current_user
    end
    redirect_to :back
  end

  def flag
    @review = Review.find(params[:id])
    if current_user
      if current_user.disliked? @review
        @review.undisliked_by current_user
      else
        @review.disliked_by current_user
        @review.update(flagged: true)
      end
    end
    redirect_to :back
  end

  def clear_flag
    @review = Review.find(params[:id])
    if current_user.admin == true
      @review.update(flagged: false)
    end
    redirect_to :back
  end

  def hide
    @review = Review.find(params[:id])
    if current_user.admin == true
      @review.update(hidden: true, flagged: false)
    end
    redirect_to :back
  end


	private

	def review_params
		params.require(:review).permit(:content, :title, :rating)
	end
end
