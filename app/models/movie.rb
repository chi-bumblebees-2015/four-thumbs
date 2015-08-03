class Movie < ActiveRecord::Base
  has_many :reviews

  def trusted_reviews
  	reviews.joins(:user).where('users.trusted' => true).order(rating: :desc)
  end

  def user_reviews
  	reviews.joins(:user).where('users.trusted' => false).order(rating: :desc)
  end

  def all_reviews
  	reviews.order(rating: :desc)
  end


end
