class CommentsController < ApplicationController
  def create
    if current_user
      @review = Review.find(params[:review_id])
      @movie = @review.movie
      @new_comment = Comment.new(comment_params)
      @new_comment.review = @review
      if @new_comment.save
        redirect_to [@movie, @review]
      else
        @error = "Could not save comment. Please revise."
        render @review
      end
    else
      redirect_to '/'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
