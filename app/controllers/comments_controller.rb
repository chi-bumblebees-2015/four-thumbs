class CommentsController < ApplicationController
  def create
    if current_user
      @review = Review.find(params[:review_id])
      @movie = @review.movie
      @new_comment = Comment.new(comment_params)
      @new_comment.review = @review
      @new_comment.user = current_user
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

  def flag
    @comment = Comment.find(params[:id])
    if current_user
      if current_user.disliked? @comment
        @comment.undisliked_by current_user
      else
        @comment.disliked_by current_user
        @comment.update(flagged: true)
      end
    end
    redirect_to :back
  end

  def clear_flag
    @comment = Comment.find(params[:id])
    if current_user.admin == true
      @comment.update(flagged: false)
    end
    redirect_to :back
  end

  def hide
    @comment = Comment.find(params[:id])
    if current_user.admin == true
      @comment.update(hidden: true, flagged: false)
    end
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
