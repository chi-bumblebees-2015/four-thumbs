class NestedComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment

  acts_as_votable

  def self.all_flagged
    NestedComment.where(flagged: true).sort_by do |comment|
      comment.get_dislikes.size
    end
  end

end
