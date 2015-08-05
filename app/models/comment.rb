class Comment < ActiveRecord::Base
  belongs_to :review
  belongs_to :user
  has_many :nested_comments
  acts_as_votable

  def self.all_flagged
    Comment.where(flagged: true).sort_by do |comment|
      comment.get_dislikes.size
    end
  end

end
