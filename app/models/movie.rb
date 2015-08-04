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
    user_count = self.reviews.select{|review| !review.user.trusted }.count
    user_total = self.reviews.select{|review| !review.user.trusted }.map{|review| review.rating}.reduce(:+)
    trusted_count = self.reviews.select{|review| review.user.trusted }.count
    trusted_total = self.reviews.select{|review| review.user.trusted }.map{|review| review.rating}.reduce(:+)

    trusted_multiplier = 2
    total = trusted_total*trusted_multiplier + user_total
    count = trusted_count*trusted_multiplier + user_count
    if count == 0
      return 0
    else
      return (total.to_f/count.to_f).round
    end
  end


end
