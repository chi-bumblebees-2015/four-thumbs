class Review < ActiveRecord::Base


  belongs_to :user
  belongs_to :movie
  has_many :comments
  acts_as_votable

  validates :user, uniqueness: { scope: :movie, message: "cannot review a movie more than once"}


end
