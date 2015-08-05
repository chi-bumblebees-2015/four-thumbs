class Review < ActiveRecord::Base


  belongs_to :user
  belongs_to :movie
  has_many :comments
  acts_as_votable

  validates :rating, :inclusion=> { :in => [0,1,2,3,4]}
  validates :user, uniqueness: { scope: :movie, message: "cannot review a movie more than once"}

  def unhidden_comments
    self.comments.where(hidden: false)
  end

  def self.all_flagged
    Review.where(flagged: true)
  end

end
