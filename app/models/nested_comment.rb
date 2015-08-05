class NestedComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment

  acts_as_votable
end
