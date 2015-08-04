class Movie < ActiveRecord::Base
  has_many :reviews

  def trusted_reviews
  	reviews.joins(:user).where('users.trusted' => true).order(rating: :desc)
  end

  def user_reviews
  	reviews.joins(:user).where('users.trusted' => false).order(rating: :desc)
  end

  def all_reviews
  	reviews.joins(:user).order(rating: :desc)
  end

  def movie_score
    count = self.reviews.count
    total = self.reviews.map{|review| review.rating}.reduce(:+)
    if count == 0
      return 0
    else
      return (total.to_f/count.to_f).round
    end
  end


end
