class NestedCommentsController < ApplicationController

  def flag
    @nested_comment = NestedComment.find(params[:id])
    if current_user
      if current_user.disliked? @nested_comment
        @nested_comment.undisliked_by current_user
      else
        @nested_comment.disliked_by current_user
        @nested_comment.update(flagged: true)
      end
    end
    redirect_to :back
  end

  def clear_flag
    @nested_comment = NestedComment.find(params[:id])
    if current_user.admin == true
      @nested_comment.update(flagged: false)
    end
    redirect_to :back
  end

  def hide
    @nested_comment = NestedComment.find(params[:id])
    if current_user.admin == true
      @nested_comment.update(hidden: true, flagged: false)
    end
    redirect_to :back
  end


end
