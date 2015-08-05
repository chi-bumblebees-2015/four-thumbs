class Comment < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  def self.all_flagged
    Comment.where(flagged: true)
  end

end
