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
    user_review_number_total = self.reviews.select{|review| !review.user.trusted }.map{|review| review.user.reviews.count * review.rating}.reduce(:+)
    user_review_number_count = self.reviews.select{|review| !review.user.trusted }.map{|review| review.user.reviews.count}.reduce(:+)
    trusted_review_number_total = self.reviews.select{|review| review.user.trusted }.map{|review| review.user.reviews.count * review.rating}.reduce(:+)
    trusted_review_number_count = self.reviews.select{|review| review.user.trusted }.map{|review| review.user.reviews.count}.reduce(:+)

    trusted_multiplier = 2
    total = user_review_number_total + trusted_multiplier*trusted_review_number_total ||= 0
    count = user_review_number_count + trusted_multiplier*trusted_review_number_count ||= 1
    return (total.to_f/count.to_f).round
  end

end
